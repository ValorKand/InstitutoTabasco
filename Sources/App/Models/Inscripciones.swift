// Inscripcion.swift
// Modelo de registro a base de datos de la tabla inscripciones

import Fluent
import Vapor

final class Inscripciones: Model, Content {
    static let schema = "inscripciones"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumno_id: Alumnos

    @Field(key: "ciclo_escolar")
    var ciclo_escolar: String

    @Field(key: "seccion")
    var seccion: String

    @Field(key: "grado")
    var grado: String

    @Field(key: "domicilio")
    var domicilio: String

    @Field(key: "emergencia_tel")
    var emergencia_tel: String

    @Field(key: "fecha_registro")
    var fecha_registro: Date

    init() {}

    init(
        id: Int? = nil,
        alumno_id: Alumnos,
        ciclo_escolar: String,
        seccion: String,
        grado: String,
        domicilio: String,
        emergencia_tel: String,
        fecha_registro: Date
    ) {
        self.id = id
        self.alumno_id = alumno_id
        self.ciclo_escolar = ciclo_escolar
        self.seccion = seccion
        self.grado = grado
        self.domicilio = domicilio
        self.emergencia_tel = emergencia_tel
        self.fecha_registro = fecha_registro
    }
}
