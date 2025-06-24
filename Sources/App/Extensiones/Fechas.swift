//
//  Fechas.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en dd?/06/25.
//

import Foundation

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")  // Asegura un formato consistente
        formatter.timeZone = TimeZone(secondsFromGMT: 0)  // <- Esta línea es crucial
        return formatter
    }()
}