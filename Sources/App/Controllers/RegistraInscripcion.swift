//
//  RegistraInscripcion.swif
//  InstitutoTabasco
//
//  Creado por Vales Corp en no me acuerdo.
//
// Registra el proceso de inscripción a la base de datos en tablas alumnos, tutores, inscripciones, historial_movimientos
// TODO: ya funciona, solo hay que afinar detalles jijiji

import Fluent
import Vapor

func registrarInscripcion(req: Request) async throws -> Response {
    let registro = try req.content.decode(RecogeInscripcion.self)

    //Verificar si el marcador de pagador esta activado o no
    let esPagadorRaw = registro.esPagador
	let esPagador = esPagadorRaw == "true" || esPagadorRaw == "on"

    guard let seccionEnum = Seccion(rawValue: registro.seccion) else {
        throw Abort(.badRequest, reason: "Sección inválida: \(registro.seccion)")
    }

    guard let parentescoEnum = Parentesco(rawValue: registro.parentesco) else {
    	throw Abort(.badRequest, reason: "Parentesco inválido: \(registro.parentesco)")
    }

    let redireccionp3 = try await req.db.transaction { db in
        // 1. Registrar Alumno
        let alumno = Alumnos(
            nombre: registro.alumnoNombre,
            apellidoPaterno: registro.alumnoApellidoPaterno,
            apellidoMaterno: registro.alumnoApellidoMaterno,
            fechaNacimiento: registro.fechaNacimiento,
            curp: registro.curp
        )
        try await alumno.create(on: db)

        // 2. Registrar Tutor dependiendo de si se marcó si es pagador o no
        // Si el tutor es pagador:
        // if let esPagador = registro.esPagador, esPagador <– anterior
        if esPagador {

    			// Tutor es pagador
    			let tutor = Tutores(
        			alumnoId: alumno.id!,
        			parentesco: parentescoEnum,
        			nombre: registro.tutorNombre,
        			apellidoPaterno: registro.tutorApellidoPaterno,
        			apellidoMaterno: registro.tutorApellidoMaterno,
        			curp: registro.tutorCurp,
        			telefono: registro.tutorTelefono,
        			correo: registro.tutorCorreo,
        			esPagador: true,
        			rfc: registro.tutorRfc
    			)
    			try await tutor.create(on: db)

		} else {

			// Tutor NO es pagador: se registra tutor + pagador
			let tutor = Tutores(
		    		alumnoId: alumno.id!,
		    		parentesco: parentescoEnum,
		    		nombre: registro.tutorNombre,
		    		apellidoPaterno: registro.tutorApellidoPaterno,
		    		apellidoMaterno: registro.tutorApellidoMaterno,
				curp: registro.tutorCurp,
		    		telefono: registro.tutorTelefono,
		    		correo: registro.tutorCorreo,
		    		esPagador: false,
		    		rfc: registro.tutorRfc
			)
			try await tutor.create(on: db)

    			// Validación obligatoria de campos del pagador
    			guard let nombre = registro.pagadorNombre,
          	let apellidoPaterno = registro.pagadorApellidoPaterno,
            	let apellidoMaterno = registro.pagadorApellidoMaterno,
            	let curp = registro.pagadorCurp,
            	let telefono = registro.pagadorTelefono,
            	let correo = registro.pagadorCorreo,
            	let rfc = registro.pagadorRfc else {
        		throw Abort(.badRequest, reason: "Faltan datos del pagador.")
    		}

    		let pagador = Pagadores(
        		alumnoId: alumno.id!,
        		nombre: registro.pagadorNombre ?? "",
    			apellidoPaterno: registro.pagadorApellidoPaterno ?? "",
    			apellidoMaterno: registro.pagadorApellidoMaterno ?? "",
    			curp: registro.pagadorCurp ?? "",
    			telefono: registro.pagadorTelefono ?? "",
    			correo: registro.pagadorCorreo ?? "",
    			rfc: registro.pagadorRfc ?? ""
    		)
    		try await pagador.create(on: db)
		}

        // 4. Registro de Inscripción
        let inscripcion = Inscripciones(
            alumnoId: alumno.id!,
            cicloEscolar: registro.cicloEscolar,
            seccion: seccionEnum,
            grado: registro.grado,
            domicilio: registro.domicilio,
            emergenciaTel: registro.emergenciaTel,
            fechaRegistro: Date(),
        )
        try await inscripcion.create(on: db)

		// Retorna la vista con el id del alumno
        return req.redirect(to: "/inscripcion/\(alumno.id!)")
    }
    return redireccionp3
}