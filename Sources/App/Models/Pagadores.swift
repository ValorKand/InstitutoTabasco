// Pagador.swift
// Modelo de registro a base de datos de la tabla pagadores

import Fluent
import Vapor

final class Pagadores: Model, Content {
    static let schema = "pagadores"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumnoId: Alumnos

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellidoPaterno: String

    @Field(key: "apellido_materno")
    var apellidoMaterno: String

    @Field(key: "curp")
    var curp: String

    @Field(key: "telefono")
    var telefono: String

    @Field(key: "correo")
    var correo: String

    init() {}

    init(
        id: Int? = nil,
        alumnoId: Int,
        nombre: String,
        apellidoPaterno: String,
        apellidoMaterno: String,
        curp: String,
        telefono: String,
        correo: String,
    ) {
        self.id = id
        self.$alumnoId.id = alumnoId
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.curp = curp
        self.telefono = telefono
        self.correo = correo
    }
}
