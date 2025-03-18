// HistorialMovimiento.swift
// Modelo de registro a base de datos de la tabla historial_movimientos

import Fluent
import Vapor

final class HistorialMovimiento: Model, Content {
    static let schema = "historial_movimientos"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumno_id: Alumno

    @Field(key: "tipo_movimiento")
    var tipo_movimiento: String

    @Field(key: "detalles")
    var detalles: String

    @Field(key: "fecha")
    var fecha: Date

    init() {}

    init(
        id: Int? = nil,
        alumno_id: Alumno,
        tipo_movimiento: String,
        detalles: String,
        fecha: Date
    ) {
        self.id = id
        self.alumno_id = alumno_id
        self.tipo_movimiento = tipo_movimiento
        self.detalles = detalles
        self.fecha = fecha
    }
}
