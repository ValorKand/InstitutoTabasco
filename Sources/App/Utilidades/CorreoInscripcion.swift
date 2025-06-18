//
//	CorreoInscripcion.swift
//	InstitutoTabasco
//
//	Creado por Vales Corp en 18 jun 2025
//

import Vapor

func enviarCorreoInscripcionExitosa(req: Request, alumno: Alumnos) async throws {
    struct InscripcionContexto: Encodable {
        let alumno: Alumnos
    }

    let contexto = InscripcionContexto(alumno: alumno)

    // Renderiza la vista Leaf como HTML (usa .get() para obtener View no futuro)
    let renderedView = try await req.view.render("inscripcion", contexto).get()
    let html = renderedView.data.getString(at: 0, length: renderedView.data.readableBytes) ?? "No se pudo renderizar la vista"

    // Cargar tutores relacionados del alumno
    try await alumno.$tutores.load(on: req.db)

    // Buscar tutor pagador o el primero
    guard let tutorParaCorreo = alumno.tutores.first(where: { $0.esPagador == true }) ?? alumno.tutores.first else {
        throw Abort(.notFound, reason: "No se encontró tutor para enviar correo")
    }

    // Obtener correo
    let destinatario = tutorParaCorreo.correo

    // Enviar correo con Resend
    try await enviarCorreoConResend(
        req: req,
        to: destinatario,
        asunto: "🎓 Inscripción exitosa – Instituto Tabasco",
        cuerpoHTML: html
    )
}
