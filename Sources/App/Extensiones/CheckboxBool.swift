//CheckboxBool.swift
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
