// AlumnoTutor.swift
// Tabla intermedia para relacionar tutor con alumno

import Fluent
import Vapor

final class AlumnoTutor: Model {
    static let schema = "alumno_tutor"

    @ID(custom: "id")
    var id: Int?

    @Parent(key: "alumno_id")
    var alumno: Alumno

    @Parent(key: "tutor_id")
    var tutor: Tutor

    @Field(key: "pagador")
    var pagador: Bool

    init() {}

    init(
        id: Int? = nil,
        alumno_id: Int,
        tutor_id: Int,
        pagador: Bool
    ) {
        self.id = id
        self.$alumno.id = alumno_id
        self.$tutor.id = tutor_id
        self.pagador = pagador
    }
}
