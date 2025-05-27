// RegistraInscripcion.swift
// Registra el proceso de inscripcion a la base de datos en tablas alumnos, tutores, inscripciones, historial_movimientos
// TODO: terminar esto, hay que compioner los registros, y con esto se supone que debería funcionar :c

import Fluent
import Vapor

func registrarInscripcion(req: Request) async throws -> HTTPStatus {
    let registro = try req.content.decode(RecogeInscripcion.self)

    guard let seccionEnum = Seccion(rawValue: registro.seccion) else {
        throw Abort(.badRequest, reason: "Sección inválida: \(registro.seccion)")
    }

    return try await req.db.transaction { db in
        // 1. Registrar Alumno
        let alumno = Alumnos(
            nombre: registro.alumnoNombre,
            apellidoPaterno: registro.alumnoApellidoPaterno,
            apellidoMaterno: registro.alumnoApellidoMaterno,
            fechaNacimiento: registro.fechaNacimiento,
            //edad: registro.edad,
            curp: registro.curp
        )
        try await alumno.create(on: db)

        // OJO: parentesco es booleano, verdadero = madre, falso = padre
        // 2. Registrar Mamá
        let madre = Tutores(
            alumnoId: alumno.id!,
            parentesco: .madre,
            nombre: registro.madreNombre,
            apellidoPaterno: registro.madreApellidoPaterno,
            apellidoMaterno: registro.madreApellidoMaterno,
            curp: registro.curp,
            telefono: registro.madreTelefono,
            correo: registro.madreCorreo,
            esTutor: registro.madreEsTutor,
            esPagador: registro.madreEsPagador,
        )
        try await madre.create(on: db)

        // 3. Registrar Papá
        let padre = Tutores(
            alumnoId: alumno.id!,
            parentesco: .padre,
            nombre: registro.padreNombre,
            apellidoPaterno: registro.padreApellidoPaterno,
            apellidoMaterno: registro.padreApellidoMaterno,
            curp: registro.curp,
            telefono: registro.padreTelefono,
            correo: registro.padreCorreo,
            esTutor: registro.padreEsTutor,
            esPagador: registro.padreEsPagador,
        )
        try await padre.create(on: db)

        // 4. Registro de Inscripción
        let inscripcion = Inscripciones(
            alumnoId: alumno.id!,
            cicloEscolar: registro.cicloEscolar,
            seccion: seccionEnum,
            grado: registro.grado,
            domicilio: registro.domicilio,
            emergenciaTel: registro.emergenciaTel,
            fechaRegistro: Date(),
        )
        try await inscripcion.create(on: db)

        return .created
    }
}
