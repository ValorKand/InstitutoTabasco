//
//	ProcesoPDF.swift
//	InstitutoTabasco
//
//	Creado por Vales Corp en 17 jun 2025
//

import Foundation
import Vapor

func hacerPDF(alumno: Alumnos, html: String, req: Request) async throws -> ByteBuffer {
	// Guarda HTML temporalmente
  	let tempHTML = "/tmp/inscripcion-\(alumno.id!).html"
  	let tempPDF = "/tmp/inscripcion-\(alumno.id!).pdf"

  	try html.write(toFile: tempHTML, atomically: true, encoding: .utf8)

  	// Ejecuta wkhtmltopdf
  	let process = Process()
  	process.executableURL = URL(fileURLWithPath: "/usr/bin/wkhtmltopdf")
  	process.arguments = [
		"--page-width", "215.9mm",
		"--page-height", "139.7mm",
		tempHTML,
		tempPDF
	]
  	try process.run()
  	process.waitUntilExit()

  	guard process.terminationStatus == 0 else {
    		throw Abort(.internalServerError, reason: "No se pudo generar el PDF.")
  	}

  	// Lee el PDF generado
  	let data = try Data(contentsOf: URL(fileURLWithPath: tempPDF))
  	var buffer = ByteBufferAllocator().buffer(capacity: data.count)
  	buffer.writeBytes(data)
  	return buffer
}
