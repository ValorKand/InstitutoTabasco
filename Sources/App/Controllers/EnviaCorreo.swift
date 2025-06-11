//EnviaCorreo.swift – Vales Corp

import Vapor

struct CorreoRequest: Content {
    let para: String
    let asunto: String
    let cuerpoHTML: String
}

func enviarCorreoConResend(
    	req: Request,
    	to destinatario: String,
    	asunto: String,
    	cuerpoHTML: String
	) async throws {
    struct ResendEmail: Content {
        let from: String
        let to: [String]
        let subject: String
        let html: String
    }

    let correo = ResendEmail(
        from: "Instituto Tabasco <direcciongeneral@institutotabasco.edu.mx>", // O cualquier remitente verificado en Resend
        to: [destinatario],
        subject: asunto,
        html: cuerpoHTML
    )

    let respuesta = try await req.client.post(URI(string: "https://api.resend.com/emails")) { peticion in
        try peticion.content.encode(correo, as: .json)
        peticion.headers.bearerAuthorization = .init(token: "re_CngTWVC2_5PzmTjmtrV743jnPX2fZbmwe") // tu API key
        peticion.headers.contentType = .json
    }

    if respuesta.status != .ok && respuesta.status != .accepted {
        if let buffer = respuesta.body {
            let errorTexto = String(buffer: buffer)
            throw Abort(.internalServerError, reason: "Fallo el envío: \(errorTexto)")
        } else {
            throw Abort(.internalServerError, reason: "Fallo el envío: respuesta vacía")
        }
    }
}
