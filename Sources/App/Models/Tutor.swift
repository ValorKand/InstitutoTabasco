// Tutor.swift
// Modelo de registro a base de datos de la tabla tutor

import Fluent
import Vapor

final class Tutor: Model, Content {
    static let schema = "tutores"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellido_paterno: String

    @Field(key: "apellido_materno")
    var apellido_materno: String

    @Field(key: "telefono")
    var telefono: String

    @Field(key: "domicilio")
    var domicilio: String

    @Field(key: "numero_emergencia")
    var numero_emergencia: String

    @Field(key: "correo")
    var correo: String

    @Field(key: "parentesco")
    var parentesco: Bool

    init() {}

    init(
        id: Int? = nil,
        nombre: String,
        apellido_paterno: String,
        apellido_materno: String,
        telefono: String,
        domicilio: String,
        numero_emergencia: String,
        correo: String,
        parentesco: Bool
    ) {
        self.id = id
        self.nombre = nombre
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.telefono = telefono
        self.domicilio = domicilio
        self.numero_emergencia = numero_emergencia
        self.correo = correo
        self.parentesco = parentesco
    }
}
