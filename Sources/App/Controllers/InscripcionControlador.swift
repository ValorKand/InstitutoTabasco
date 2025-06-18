//
//  InscripcionControlador.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en 17/06/25.
//

import Vapor
import Fluent

/*func mostrarInscripcion(req: Request) async throws -> View {
    guard let alumnoID = req.parameters.get("alumnoID", as: Int.self) else {
        throw Abort(.badRequest)
    }

    guard let alumno = try await Alumnos.find(alumnoID, on: req.db) else {
		throw Abort(.notFound)
	}

    struct InscripcionContextop3: Encodable {
        let alumno: Alumnos
    }

    let contextop3 = InscripcionContextop3(alumno: alumno)

    return try await req.view.render("inscripcion", contextop3)
}*/

// Función para mostrar la vista en pdf
func mostrarInscripcionPDF(req: Request) async throws -> Response {
    guard let alumnoID = req.parameters.get("alumnoID", as: Int.self),
          let alumno = try await Alumnos.find(alumnoID, on: req.db) else {
        throw Abort(.badRequest)
    }

    struct InscripcionContexto: Encodable {
        let alumno: Alumnos
    }

    let contexto = InscripcionContexto(alumno: alumno)
	let view = try await req.view.render("inscripcion", contexto).get() // 👈 aquí la clave
	let html = view.data.getString(at: 0, length: view.data.readableBytes) ?? ""

    // Generar PDF
    let pdf = try await hacerPDF(alumno: alumno, html: html, req: req)

    return Response(
        status: .ok,
        headers: [
            "Content-Type": "application/pdf",
            "Content-Disposition": "inline; filename=\"inscripcion-\(alumno.id!).pdf\""
        ],
        body: .init(buffer: pdf)
    )
}

