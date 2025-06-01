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
        // 2. Registrar Tutor
        let tutor = Tutores(
            alumnoId: alumno.id!,
            parentesco: .madre,
            nombre: registro.tutorNombre,
            apellidoPaterno: registro.tutorApellidoPaterno,
            apellidoMaterno: registro.tutorApellidoMaterno,
            curp: registro.curp,
            telefono: registro.tutorTelefono,
            correo: registro.tutorCorreo,
            esTutor: registro.quienEsTutor,
            esPagador: registro.quienEsPagador,
        )
        try await tutor.create(on: db)

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
