//
//  MainViewModel.swift
//  ParquesUI
//
//  Created by Paco Pulido on 1/12/25.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var equipos: [Equipo] = []
    @Published var jugadores: [Jugador] = []
    
    func cargarEquipos() {
        let  urlTxt="http://91.98.194.227:8080/apipremier/equipos"
        guard let url = URL(string: urlTxt) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                let result =  try JSONDecoder().decode(EquiposResult.self, from: data)
                DispatchQueue.main.async {
                    self.equipos = result.equipos ?? []
                }

            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
        }.resume()
    }
    
    func cargarJugadores() {
        let urlTxt = "http://91.98.194.227:8080/apipremier/jugadores"
        guard let url = URL(string: urlTxt) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(JugadoresResult.self, from: data)
                DispatchQueue.main.async {
                    self.jugadores = result.jugadores ?? []
                }
            } catch {
                print("Error serializing json jugadores", error)
            }
        }.resume()
    }
   
  }


