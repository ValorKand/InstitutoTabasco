import Fluent
import FluentPostgresDriver
import Leaf
import NIOSSL
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    app.http.server.configuration.hostname = "0.0.0.0"
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    ContentConfiguration.global.use(
        decoder: {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
            return decoder
        }(), for: .json)

    ContentConfiguration.global.use(
        encoder: {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(DateFormatter.yyyyMMdd)
            return encoder
        }(), for: .json)

    app.databases.use(
        DatabaseConfigurationFactory.postgres(
            configuration: .init(
                hostname: Environment.get("DATABASE_HOST") ?? "201.151.223.250",
                port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:))
                    ?? SQLPostgresConfiguration.ianaPortNumber,
                username: Environment.get("DATABASE_USERNAME") ?? "jezabel",
                password: Environment.get("DATABASE_PASSWORD") ?? "ITabasco1",
                database: Environment.get("DATABASE_NAME") ?? "escuela",
                tls: .prefer(try .init(configuration: .clientDefault)))
        ), as: .psql)

    app.migrations.add(CreateTodo())

    app.views.use(.leaf)

	//se registra el controlador del pdf a la vistap3
	//try app.register(collection: PruebaPDF())

    // register routes
    try routes(app)
}
