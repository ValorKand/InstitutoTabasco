import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.get("lema") { req async -> String in
        "¡Fieles al Deber!"
    }

    app.get("inscripcion.leaf") { req async throws -> View in
        try await req.view.render("inscripcion", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.post("registraInscripcion", use: registrarInscripcion)

	//Esto es solo para probar si funciona el envío de correo
	app.get("probarCorreo") { req async throws -> String in
		try await enviarCorreoConResend(
    			req: req,
        		to: "david.tab2023@icloud.com",
        		asunto: "Prueba desde Vapor ❤️",
        		cuerpoHTML: "<h1>¡Hola, mi vida!</h1><p>Este es un correo enviado desde Vapor con Resend.</p>"
    		)
    		return "Correo enviado correctamente 💌"
	}

    try app.register(collection: TodoController())
}
