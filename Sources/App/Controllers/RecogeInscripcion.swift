// RecojeInscripcion.swift
// Recoje del formulario los datos de la inscripcion (alumno, tutor, ciclo escolar, todo.)

import Vapor

struct RecogeInscripcion: Content {

    // Datos de alumno
    let alumno_nombre: String
    let alumno_apellido_paterno: String
    let alumno_apellido_materno: String
    let fecha_nacimiento: Date
    let edad: Int
    let curp: String

    // Datos de mamá
    let madre_nombre: String
    let madre_apellido_paterno: String
    let madre_apellido_materno: String
    let madre_telefono: String
    let madre_ocupacion: String
    let madre_domicilio: String
    let madre_numero_emergencia: String
    let madre_correo: String
    let madre_es_tutor: Bool
    let madre_pagador: Bool

    // Datos de papá
    let padre_nombre: String
    let padre_apellido_paterno: String
    let padre_apellido_materno: String
    let padre_telefono: String
    let padre_ocupacion: String
    let padre_domicilio: String
    let padre_numero_emergencia: String
    let padre_correo: String
    let padre_es_tutor: Bool
    let padre_pagador: Bool

    //Datos de inscripción
    let ciclo_escolar: String
    let seccion: String
    let año_cursara: String

    //Fecha del registro
    let fecha_inscripcion: Date
}
