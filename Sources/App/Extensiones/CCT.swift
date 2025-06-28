//
//  CCT.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en 17/06/25.
//

extension Seccion {
    var cct: String {
        switch self {
        case .preescolar: return "27PJN0086O"
        case .primaria: return "27PPR0002G"
        case .secundaria: return "27PES0001A"
        case .bachillerato: return "27PCB0004Z"
        }
    }
}