//
//  CheckboxBool.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en dd?/06/25.
//
import Vapor

@propertyWrapper
struct CheckboxBool: Decodable {
    var wrappedValue: Bool

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            wrappedValue = !value.isEmpty
        } else {
            wrappedValue = false
        }
    }
}
