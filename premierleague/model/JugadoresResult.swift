//
//  JugadoresResult.swift
//  premierleague (iOS)
//
//  Created by jorge on 8/12/25.
//

class JugadoresResult: Codable {
    let jugadores:[Jugador]?
    private enum CodingKeys: String, CodingKey{
        case jugadores = "jugadores"
    }
}
struct Jugador :Codable,Identifiable,Hashable{
    let id: Int
     let nombre: String
     let avatar_url: String
     let club: String
     let nacionalidad: String
     let goles: Int
     
}
