// RecojeInscripcion.swift
// Recoje del formulario los datos de la inscripcion (alumno, tutor, ciclo escolar, todo.)

import Vapor

struct RecogeInscripcion: Decodable {

    // Datos de alumno
    let alumnoNombre: String
    let alumnoApellidoPaterno: String
    let alumnoApellidoMaterno: String
    let fechaNacimiento: Date
    let curp: String

    // Datos de tutor
    let tutorNombre: String
    let tutorApellidoPaterno: String
    let tutorApellidoMaterno: String
    let tutorCurp: String
    let tutorTelefono: String
    let tutorCorreo: String
    let parentesco: String
    let esPagador: String?
    let tutorRfc: String

    // Datos de pagador
    let pagadorNombre: String?
    let pagadorApellidoPaterno: String?
    let pagadorApellidoMaterno: String?
    let pagadorCurp: String?
    let pagadorTelefono: String?
    let pagadorCorreo: String?
    let pagadorRfc: String?

    //Datos de inscripción
    let cicloEscolar: String
    let seccion: String
    let grado: String
    let domicilio: String
    let emergenciaTel: String

    //Fecha del registro
    //let fechaInscripcion: Date
}
