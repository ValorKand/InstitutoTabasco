//
//  InscripcionContexto.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en 15/06/25.
//

import Foundation

struct InscripcionContexto: Encodable {
    let alumno: AlumnoDato
    let tutor: TutorDato
    let pagador: PagadorDato?
    let inscripcion: InscripcionDato
    let fecha: String
}

struct AlumnoDato: Encodable {
    let nombre: String
    let fechaNacimiento: String
    let curp: String
}

struct TutorDato: Encodable {
    let parentesco: String
    let nombre: String
    let correo: String
    let telefono: String
    let rfc: String
}

struct PagadorDato: Encodable {
    let nombre: String
    let correo: String
    let telefono: String
    let rfc: String
}

struct InscripcionDato: Encodable {
    let cicloEscolar: String
    let grado: String
    let seccion: String
    let domicilio: String
    let emergenciaTel: String
}
