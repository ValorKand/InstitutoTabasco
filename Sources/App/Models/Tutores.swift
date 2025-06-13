// Tutor.swift
// Modelo de registro a base de datos de la tabla tutor

import Fluent
import Vapor

enum Parentesco: String, Codable, CaseIterable {
    case madre
    case padre
    case otro
}

final class Tutores: Model, Content {
    static let schema = "tutores"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumnoId: Alumnos

    @Enum(key: "parentesco")
    var parentesco: Parentesco

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

    @Field(key: "es_pagador")
    var esPagador: Bool?

    @Field(key: "rfc")
    var rfc: String

    init() {}

    init(
        id: Int? = nil,
        alumnoId: Int,
        parentesco: Parentesco,
        nombre: String,
        apellidoPaterno: String,
        apellidoMaterno: String,
        curp: String,
        telefono: String,
        correo: String,
        esPagador: Bool,
        rfc: String
    ) {
        self.id = id
        self.$alumnoId.id = alumnoId
        self.parentesco = parentesco
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.curp = curp
        self.telefono = telefono
        self.correo = correo
        self.esPagador = esPagador
        self.rfc = rfc
    }
}
