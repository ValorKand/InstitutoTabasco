// RegistraInscripcion.swift
// Registra el proceso de inscripcion a la base de datos en tablas alumnos, tutores, inscripciones, historial_movimientos

import Fluent
import Vapor

func registrarInscripcion(req: Request) async throws -> HTTPStatus {
    let registro = try req.content.decode(RecogeInscripcion.self)

    return try await req.db.transaction { db in
        // 1. Registrar Alumno
        let alumno = Alumno(
            nombre: registro.alumno_nombre,
            apellido_paterno: registro.alumno_apellido_paterno,
            apellido_materno: registro.alumno_apellido_materno,
            fecha_nacimiento: registro.fecha_nacimiento,
            edad: registro.edad,
            curp: registro.curp
        )
        try await alumno.create(on: db)

        // OJO: parentesco es booleano, verdadero = madre, falso = padre
        // 2. Registrar Mamá
        let madre = Tutor(
            nombre: registro.madre_nombre,
            apellido_paterno: registro.madre_apellido_paterno,
            apellido_materno: registro.madre_apellido_materno,
            telefono: registro.madre_telefono,
            domicilio: registro.madre_domicilio,
            numero_emergencia: registro.madre_numero_emergencia,
            correo: registro.madre_correo,
            parentesco: true
        )
        try await madre.create(on: db)

        // 3. Registrar Papá
        let padre = Tutor(
            nombre: registro.padre_nombre,
            apellido_paterno: registro.padre_apellido_paterno,
            apellido_materno: registro.padre_apellido_materno,
            telefono: registro.padre_telefono,
            domicilio: registro.padre_domicilio,
            numero_emergencia: registro.padre_numero_emergencia,
            correo: registro.padre_correo,
            parentesco: false
        )
        try await padre.create(on: db)

        // 4. Asociar tutores con el alumno solo si fueron marcados como tutores
        if registro.madre_es_tutor == true {
            try await AlumnoTutor(
                alumno_id: try alumno.requireID(),
                tutor_id: try madre.requireID(),
                pagador: registro.madre_pagador ?? false
            ).create(on: db)
        }

        if registro.padre_es_tutor == true {
            try await AlumnoTutor(
                alumno_id: try alumno.requireID(),
                tutor_id: try padre.requireID(),
                pagador: registro.padre_pagador ?? false
            ).create(on: db)
        }

        return .created
    }
}
