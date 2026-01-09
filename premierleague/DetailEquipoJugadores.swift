//
//  DetailEquipoJugadores.swift
//  premierleague (iOS)
//
//  Created by jorge on 10/12/25.
//
import SwiftUI
import Foundation
struct DetailEquipoJugadores: View { //Es para que pueda filtrar los jugadores de los equipos he preguntado a la ia como podia hacerlo y ya he podido adaptar mi codigo, no sabia como se escribia este codigo
    let equipo: Equipo
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.jugadores.filter { $0.club == equipo.nombre }) { jugador in
                    DetailEquipo(jugador: jugador)
                }
            }
            .padding()
        }
        .navigationTitle(equipo.nombre ?? "Equipo")
    }
}
