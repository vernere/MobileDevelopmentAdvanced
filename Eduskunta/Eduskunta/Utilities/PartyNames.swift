//
//  PartyNames.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation

enum PartyNames {
    static func fullName(for abbreviation: String) -> String {
        switch abbreviation.lowercased() {
        case "kok": return "Kokoomus"
        case "sd": return "Suomen Sosiaalidemokraattinen puolue"
        case "ps": return "Perussuomalaiset"
        case "kesk": return "Keskusta"
        case "vihr": return "Vihreät"
        case "vas": return "Vasemmistoliitto"
        case "r": return "Suomen ruotsalainen kansanpuolue"
        case "kd": return "Kristillisdemokraatit"
        case "liik": return "Liike Nyt"
        default: return abbreviation
        }
    }
}
