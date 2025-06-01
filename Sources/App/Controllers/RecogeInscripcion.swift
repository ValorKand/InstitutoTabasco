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
    @CheckboxBool var quienEsTutor: Bool
    @CheckboxBool var quienEsPagador: Bool

    //Datos de inscripción
    let cicloEscolar: String
    let seccion: String
    let grado: String
    let domicilio: String
    let emergenciaTel: String

    //Fecha del registro
    //let fechaInscripcion: Date
}
