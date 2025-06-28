import Fluent
import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.get("lema") { req async -> String in
        "¡Fieles al Deber!"
    }

    app.get("formularioInscripcion.leaf") { req async throws -> View in
        try await req.view.render("formularioInscripcion", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.get("formularioBeta.leaf") { req async throws -> View in
        try await req.view.render("formularioBeta", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.post("registraInscripcion", use: registrarInscripcion)

    /*app.get("inscripcion", ":alumnoID") { req async throws in
		try await mostrarInscripcionPDF(req: req)
	}*/
	app.get("inscripcion", ":alumnoID", use: mostrarInscripcionPDF)


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

	app.get("inscripcionPlantillaVacia") { req async throws -> View in
		return try await req.view.render("inscripcion")
	}

	//Probar contextos y plantillas
	app.get("pruebaLeaf") { req async throws -> View in

		struct SimpleContext: Encodable {
			let saludo: String
		}

        let contexto = SimpleContext(saludo: "Hola desde Leaf!")
        return try await req.view.render("prueba", contexto)
    }

    try app.register(collection: TodoController())
}
