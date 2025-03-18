// Alumno.swift
// Modelo de registro a base de datos de la tabla alumno

import Fluent
import Vapor

final class Alumno: Model, Content {
    static let schema = "alumnos"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellido_paterno: String

    @Field(key: "apellido_materno")
    var apellido_materno: String

    @Field(key: "fecha_nacimiento")
    var fecha_nacimiento: Date

    @Field(key: "edad")
    var edad: Int?

    @Field(key: "curp")
    var curp: String

    init() {}

    init(
        id: Int? = nil,
        nombre: String,
        apellido_paterno: String,
        apellido_materno: String,
        fecha_nacimiento: Date,
        edad: Int,
        curp: String
    ) {
        self.id = id
        self.nombre = nombre
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.fecha_nacimiento = fecha_nacimiento
        self.edad = edad
        self.curp = curp
    }
}
