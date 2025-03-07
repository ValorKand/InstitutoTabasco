import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Instituto Tabasco – Inscripciones"])
    }

    app.get("lema") { req async -> String in
        "¡Fieles al Deber!"
    }

    try app.register(collection: TodoController())
}
