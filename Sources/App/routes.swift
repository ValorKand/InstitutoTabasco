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

    try app.register(collection: TodoController())
}
