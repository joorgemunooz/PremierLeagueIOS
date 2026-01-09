//
//  EquiposResult.swift
//  premierleague (iOS)
//
//  Created by jorge on 8/12/25.
//


class EquiposResult: Codable {
    let equipos:[Equipo]?
    private enum CodingKeys: String, CodingKey{
        case equipos = "equipos"
    }
}
struct Equipo :Codable,Hashable{
    let id:Int?
    let nombre:String?
    let badge_url:String?
    let web_oficial:String?
    private enum CodingKeys: String, CodingKey{
        case id="id"
        case nombre="nombre"
        case badge_url="badge_url"
        case web_oficial="web_oficial"
    }
}
