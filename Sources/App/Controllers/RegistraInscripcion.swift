// RegistraInscripcion.swift
// Registra el proceso de inscripcion a la base de datos en tablas alumnos, tutores, inscripciones, historial_movimientos
//TODO: terminar esto, hay que compioner los registros, y con esto se supone que debería funcionar :c

import Fluent
import Vapor

func registrarInscripcion(req: Request) async throws -> HTTPStatus {
    let registro = try req.content.decode(RecogeInscripcion.self)

    return try await req.db.transaction { db in
        // 1. Registrar Alumno
        let alumno = Alumnos(
            nombre: registro.alumno_nombre,
            apellido_paterno: registro.alumno_apellido_paterno,
            apellido_materno: registro.alumno_apellido_materno,
            fecha_nacimiento: registro.fecha_nacimiento,
            //edad: registro.edad,
            curp: registro.curp
        )
        try await alumno.create(on: db)

        // OJO: parentesco es booleano, verdadero = madre, falso = padre
        // 2. Registrar Mamá
        let madre = Tutores(
            nombre: registro.madre_nombre,
            apellido_paterno: registro.madre_apellido_paterno,
            apellido_materno: registro.madre_apellido_materno,
            curp: registro.curp,
            telefono: registro.madre_telefono,
            domicilio: registro.domicilio,
            numero_emergencia: registro.telefono_emergencia,
            correo: registro.madre_correo,
            es_tutor: registro.madre_es_tutor,
            madre_pagador: registro.es_pagador,
            parentesco: true
        )
        try await madre.create(on: db)

        // 3. Registrar Papá
        let padre = Tutores(
            nombre: registro.padre_nombre,
            apellido_paterno: registro.padre_apellido_paterno,
            apellido_materno: registro.padre_apellido_materno,
            telefono: registro.padre_telefono,
            domicilio: registro.domicilio,
            numero_emergencia: registro.telefono_emergencia,
            correo: registro.padre_correo,
            parentesco: false
        )
        try await padre.create(on: db)

        return .created
    }
}
