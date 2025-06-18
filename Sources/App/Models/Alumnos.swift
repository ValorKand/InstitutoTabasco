//
//  Alumnos.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en dd?/06/25.
//
// Modelo de registro a base de datos de la tabla alumno

import Fluent
import Vapor

final class Alumnos: Model, Content {
    static let schema = "alumnos"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellidoPaterno: String

    @Field(key: "apellido_materno")
    var apellidoMaterno: String

    @Field(key: "fecha_nacimiento")
    var fechaNacimiento: Date

    @Field(key: "curp")
    var curp: String

    init() {}

    init(
        id: Int? = nil,
        nombre: String,
        apellidoPaterno: String,
        apellidoMaterno: String,
        fechaNacimiento: Date,
        curp: String
    ) {
        self.id = id
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.fechaNacimiento = fechaNacimiento
        self.curp = curp
    }
}
