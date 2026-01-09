import SwiftUI
import WebKit

//Esto me lo ha hecho la ia para poder renderizar svg porque el nativo de ios lo no hace
struct SVGView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { //Lo ha hecho la ia porque como no es un Image no puedo hacer un .resizable y no encuentro nada para ajustar el tamaño del svg asique de esto no tengo ni idea, lo hago porque es diseño y no funcionalidad que creo que es lo importante
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style>
            html, body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                background: transparent;
                overflow: hidden;
            }
            object {
                width: 100%;
                height: 100%;
            }
        </style>
        </head>
        <body>
            <object data="\(url.absoluteString)" type="image/svg+xml"></object>        </body>
        </html>
        """
        uiView.loadHTMLString(html, baseURL: nil)
    }
}//A partir de aqui ya lo he hecho todo yo



struct CardEquipo: View {
    let equipo: Equipo
    
    var body: some View {
        HStack(spacing: 16) {
                if let badgeURL = equipo.badge_url, let url = URL(string: badgeURL) {
                SVGView(url: url)
                .frame(width: 48, height: 48)//Y ahora esto es para ajustar el tamaño del escudo como quiera
                
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(equipo.nombre ?? "-")
                    .foregroundColor(.white)
                
                HStack(spacing: 12) {
                    Button(action: { //Esto boton no hace nada esta solo replicando el boton que hay en la web, en React si lo tengo para que se guarde ese equipo como favorito
                      
                    }) {
                        Text("Seguir")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 16)
                            .background(Color.purple)
                            .cornerRadius(17)
                    }

                    if let web = equipo.web_oficial, let url = URL(string: web) {
                        Link(destination: url) {
                            Text("Web")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 16)
                                .background(Color.purple)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 40/255, green: 0/255, blue: 60/255))
        .cornerRadius(16)
    }
}

