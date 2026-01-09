//
//  Result.swift
//  premierleague (iOS)
//
//  Created by jorge on 8/12/25.
//

import Foundation
class Result: Codable {
    let Equipos:[Equipo]?
    private enum CodingKeys: String, CodingKey{
        case parques = "parques"
    }
}
struct Equipos :Codable,Hashable{
    let id:String?
    let nombre:String?
    let badge_url:String?
    let web_oficial:String?
    private enum CodingKeys: String, CodingKey{
        case id="id"
        case nombre="nombre"
        case badge_url="escudo"
        case web_oficial="web"
    }
}
