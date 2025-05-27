// RecojeInscripcion.swift
// Recoje del formulario los datos de la inscripcion (alumno, tutor, ciclo escolar, todo.)

import Vapor

struct RecogeInscripcion: Decodable {

    // Datos de alumno
    let alumnoNombre: String
    let alumnoApellidoPaterno: String
    let alumnoApellidoMaterno: String
    let fechaNacimiento: Date
    //let edad: Int
    let curp: String

    // Datos de mamá
    let madreNombre: String
    let madreApellidoPaterno: String
    let madreApellidoMaterno: String
    let madreCurp: String
    let madreTelefono: String
    //let madreOcupacion: String
    //let madreDomicilio: String
    //let madreNumeroEmergencia: String
    let madreCorreo: String
    @CheckboxBool var madreEsTutor: Bool
    @CheckboxBool var madreEsPagador: Bool

    // Datos de papá
    let padreNombre: String
    let padreApellidoPaterno: String
    let padreApellidoMaterno: String
    let padreCurp: String
    let padreTelefono: String
    //let padreOcupacion: String
    //let padreDomicilio: String
    //let padreNumeroEmergencia: String
    let padreCorreo: String
    @CheckboxBool var padreEsTutor: Bool
    @CheckboxBool var padreEsPagador: Bool

    //Datos de inscripción
    let cicloEscolar: String
    let seccion: String
    let grado: String
    let domicilio: String
    let emergenciaTel: String

    //Fecha del registro
    //let fechaInscripcion: Date
}
