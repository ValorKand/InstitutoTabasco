//
//  Inscripciones.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en 15/06/25.
//
//	Modelo de registro a base de datos de la tabla inscripciones

import Fluent
import Vapor

enum Seccion: String, Codable, CaseIterable {
    case preescolar
    case primaria
    case secundaria
    case bachillerato
}

final class Inscripciones: Model, Content {
    static let schema = "inscripciones"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumnoId: Alumnos

    @Field(key: "ciclo_escolar")
    var cicloEscolar: String

    @Enum(key: "seccion")
    var seccion: Seccion

    @Field(key: "grado")
    var grado: String

    @Field(key: "domicilio")
    var domicilio: String

    @Field(key: "emergencia_tel")
    var emergenciaTel: String

    @Field(key: "fecha_registro")
    var fechaRegistro: Date

    init() {}

    init(
        id: Int? = nil,
        alumnoId: Int,
        cicloEscolar: String,
        seccion: Seccion,
        grado: String,
        domicilio: String,
        emergenciaTel: String,
        fechaRegistro: Date
    ) {
        self.id = id
        self.$alumnoId.id = alumnoId
        self.cicloEscolar = cicloEscolar
        self.seccion = seccion
        self.grado = grado
        self.domicilio = domicilio
        self.emergenciaTel = emergenciaTel
        self.fechaRegistro = fechaRegistro
    }
}
