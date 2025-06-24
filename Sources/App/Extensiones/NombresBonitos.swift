//
//  NombresBonitos.swift
//  InstitutoTabasco
//
//  Creado por Vales Corp en dd?/06/25.
//

extension Seccion {
    var nombreBonito: String {
        switch self {
        case .primaria: return "Primaria"
        case .secundaria: return "Secundaria"
        case .preescolar: return "Preescolar"
        case .bachillerato: return "Bachillerato"
        }
    }
}