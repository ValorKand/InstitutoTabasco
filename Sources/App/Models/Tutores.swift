// Tutor.swift
// Modelo de registro a base de datos de la tabla tutor

import Fluent
import Vapor

final class Tutores: Model, Content {
    static let schema = "tutores"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumno_id: Alumnos

    @Field(key: "parentesco")
    var parentesco: String

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellido_paterno: String

    @Field(key: "apellido_materno")
    var apellido_materno: String

    @Field(key: "curp")
    var curp: String

    @Field(key: "telefono")
    var telefono: String

    @Field(key: "correo")
    var correo: String

    @Field(key: "es_tutor")
    var es_tutor: Bool

    @Field(key: "es_pagador")
    var es_pagador: Bool

    init() {}

    init(
        id: Int? = nil,
        alumno_id: Alumnos,
        parentesco: String,
        nombre: String,
        apellido_paterno: String,
        apellido_materno: String,
        curp: String,
        telefono: String,
        correo: String,
        es_tutor: Bool,
        es_pagador: Bool
    ) {
        self.id = id
        self.alumno_id = alumno_id
        self.parentesco = parentesco
        self.nombre = nombre
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.curp = curp
        self.telefono = telefono
        self.correo = correo
        self.es_tutor = es_tutor
        self.es_pagador = es_pagador
    }
}
