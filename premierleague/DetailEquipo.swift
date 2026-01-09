//
//  DetailEquipo.swift
//  premierleague (iOS)
//
//  Created by jorge on 10/12/25.
//

import SwiftUI

struct DetailEquipo: View {
    let jugador: Jugador
    
    var body: some View {
         HStack(spacing: 12) {
           
             AsyncImage(url: URL(string: jugador.avatar_url)) { phase in
                 if let image = phase.image {
                     image
                         .resizable()
                         .scaledToFill()
                         .frame(width: 60, height: 60)
                         .clipShape(Circle())
                 } else {
                     ProgressView()
                         .frame(width: 60, height: 60)
                 }
             }
             
             VStack(alignment: .leading, spacing: 4) {
                 Text(jugador.nombre)
                     .font(.headline)
                 Text(jugador.club)
                     .font(.subheadline)
                     .foregroundColor(.secondary)
             }
             
             Spacer()

             Text("Goles: \(jugador.goles)")
                 .font(.subheadline)
                 .fontWeight(.bold)
         }
         .padding()
         .cornerRadius(12)
         
     }
 }
