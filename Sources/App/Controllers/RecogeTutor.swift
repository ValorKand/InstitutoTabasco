// RecojeTutor.swift
// Recoje del formulario los datos de los campos de tutor
//TODO: este parece que no se usará

import Vapor

struct RecogeTutor: Content {
    let nombre: String
    let apellido_paterno: String
    let apellido_materno: String
    let telefono: String
    let ocupacion: String
    let domicilio: String
    let numero_emergencia: String
}
