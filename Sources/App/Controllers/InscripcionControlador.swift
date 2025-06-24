//
//  InscripcionControlador.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en 17/06/25.
//

import Vapor
import Fluent

// Función para mostrar la vista en pdf
func mostrarInscripcionPDF(req: Request) async throws -> Response {

	// Busca en la base de datos los datos del alumno
    guard let alumnoID = req.parameters.get("alumnoID", as: Int.self),
	let alumno = try await Alumnos.find(alumnoID, on: req.db) else {
		throw Abort(.badRequest, reason: "No se encontró el alumno con ID \(String(describing: req.parameters.get("alumnoID")))")
	}

    // Busca al tutor relacionado con el alumno, se puso opcional para manejo seguro
	// 2. Tutor (opcional, pero con manejo seguro)
    var tutor: Tutores? = nil
    do {
        tutor = try await Tutores.query(on: req.db)
            .filter(\Tutores.$alumnoId.$id == alumnoID)
            .first()
        if tutor == nil {
            req.logger.warning("Tutor no encontrado para alumnoID \(alumnoID)")
        }
    } catch {
        req.logger.error("Error al buscar tutor: \(error)")
    }

    // 3. Pagador (opcional)
    var pagador: Pagadores? = nil
    do {
        pagador = try await Pagadores.query(on: req.db)
            .filter(\Pagadores.$alumnoId.$id == alumnoID)
            .first()
        if pagador == nil {
            req.logger.warning("Pagador no encontrado para alumnoID \(alumnoID)")
        }
    } catch {
        req.logger.error("Error al buscar pagador: \(error)")
    }

    // 4. Inscripción (opcional)
    var inscripcion: Inscripciones? = nil
    do {
        inscripcion = try await Inscripciones.query(on: req.db)
            .filter(\Inscripciones.$alumnoId.$id == alumnoID)
            .first()
        if inscripcion == nil {
            req.logger.warning("Inscripción no encontrada para alumnoID \(alumnoID)")
        }
    } catch {
        req.logger.error("Error al buscar inscripción: \(error)")
    }

	// Manda al InscripcionContexto los parámetros requeridos
	// TODO: vamos a deprecar esto
	/*
    struct InscripcionContexto: Encodable {
        let alumno: Alumnos
		let tutor: Tutores?
        let pagador: Pagadores?
        let inscripcion: Inscripciones?
    }
    */

    // Este seria el supuesto nuevo contexto
    struct InscripcionContexto: Encodable {
		let alumno: AlumnoDato
		let tutor: TutorDato?
		let pagador: PagadorDato?
		let inscripcion: InscripcionDato?
	}

	//aqui empieza el contexto
	let alumnoDato = AlumnoDato(
		nombre: alumno.nombre,
		apellidoPaterno: alumno.apellidoPaterno,
		apellidoMaterno: alumno.apellidoMaterno,
		fechaNacimiento: DateFormatter.yyyyMMdd.string(from: alumno.fechaNacimiento),
		curp: alumno.curp
	)

	let tutorDato = tutor.map {
		TutorDato(
			parentesco: $0.parentesco.rawValue,
			nombre: $0.nombre,
			apellidoPaterno: $0.apellidoPaterno,
			apellidoMaterno: $0.apellidoMaterno,
			correo: $0.correo,
			telefono: $0.telefono,
			rfc: $0.rfc
		)
	}

	let pagadorDato = pagador.map {
		PagadorDato(
			nombre: $0.nombre,
			apellidoPaterno: $0.apellidoPaterno,
			apellidoMaterno: $0.apellidoMaterno,
			correo: $0.correo,
			telefono: $0.telefono,
			rfc: $0.rfc
		)
	}

	let inscripcionDato = inscripcion.map {
		InscripcionDato(
			cicloEscolar: $0.cicloEscolar,
			grado: $0.grado,
			seccion: $0.seccion.nombreBonito,
			domicilio: $0.domicilio,
			emergenciaTel: $0.emergenciaTel,
			fechaRegistro: DateFormatter.yyyyMMdd.string(from: $0.fechaRegistro)
		)
	}

	// Aquí añadí al contexto los nuevos parámetros de arriba
	let contextop3 = InscripcionContexto(alumno: alumnoDato, tutor: tutorDato, pagador: pagadorDato, inscripcion: inscripcionDato)
	let view = try await req.view.render("inscripcion", contextop3).get()
	let html = view.data.getString(at: 0, length: view.data.readableBytes) ?? ""

	print("Este es el contexto que se genera \(contextop3)")
	if tutor == nil {
		req.logger.warning("No se encontró tutor para alumnoID \(alumnoID)")
	}
	if pagador == nil {
		req.logger.warning("No se encontró pagador para alumnoID \(alumnoID)")
	}
	if inscripcion == nil {
		req.logger.warning("No se encontró inscripción para alumnoID \(alumnoID)")
	}

    // Generar PDF
    let pdf = try await hacerPDF(alumno: alumno, tutor: tutor, pagador: pagador, inscripcion: inscripcion, html: html, req: req)

    // Enviar el correo en segundo plano (opcional si no quieres bloquear al usuario)
	Task {
		try? await enviarCorreoInscripcionExitosa(req: req, alumno: alumno, html: html)
	}

    return Response(
        status: .ok,
        headers: [
            "Content-Type": "application/pdf",
            "Content-Disposition": "inline; filename=\"inscripcion-\(alumno.id!).pdf\""
        ],
        body: .init(buffer: pdf)
    )
}

