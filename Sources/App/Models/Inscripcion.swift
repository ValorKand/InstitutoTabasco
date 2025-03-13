// Inscripcion.swift
// Modelo de registro a base de datos de la tabla inscripciones

import Fluent
import Vapor

final class Inscripcion: Model, Content {
    static let schema = "inscripcion"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "ciclo_escolar")
    var ciclo_escolar: String

    @Field(key: "año_cursara")
    var año_cursara: Int

    @Field(key: "grupo")
    var grupo: String

    @Parent(key: "alumno_id")
    var alumno_id: Alumno

    @Parent(key: "tutor_id")
    var tutor_id: Tutor

    @Field(key: "es_tutor_principal")
    var es_tutor_principal: Bool

    @Field(key: "tiene_hermanos")
    var tiene_hermanos: Bool

    init() {}

    init(
        id: Int? = nil,
        ciclo_escolar: String,
        año_cursara: Int,
        grupo: String,
        alumno_id: Alumno,
        es_tutor_principal: Bool,
        tiene_hermanos: Bool
    ) {
        self.id = id
        self.ciclo_escolar = ciclo_escolar
        self.año_cursara = año_cursara
        self.grupo = grupo
        self.alumno_id = alumno_id
        self.es_tutor_principal = es_tutor_principal
        self.tiene_hermanos = tiene_hermanos
    }
}
