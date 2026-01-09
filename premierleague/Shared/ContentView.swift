
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView { //He usado este en vez del Stack porque me dice que no lo encuentra en el scope y he visto que para mi version de xcode no esta disponible
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.equipos, id: \.id) { equipo in
                        NavigationLink {
                            DetailEquipoJugadores(equipo: equipo, viewModel: viewModel)
                        } label: {
                            CardEquipo(equipo: equipo)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.cargarEquipos()
            viewModel.cargarJugadores()
        }
    }
}
