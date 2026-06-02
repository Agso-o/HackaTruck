//
//  ContentView.swift
//  mapa-interativo
//
//  Created by Turma02-5 on 02/06/26.
//

import SwiftUI
import MapKit

struct Lugar: Identifiable {
    let id = UUID()
    let foto: String
    let nome: String
    let descricao: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

struct ContentView: View {
    @State var lugares: [Lugar] = [
        // 1. Cristo Redentor — Rio de Janeiro, Brasil
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg/500px-Christ_the_Redeemer_-_Cristo_Redentor.jpg",
            nome: "Cristo Redentor",
            descricao: "Estátua de Jesus Cristo no topo do Corcovado, símbolo do Rio de Janeiro e do Brasil.",
            latitude: -22.951889,
            longitude: -43.210500
        ),
        // 2. Chichén Itzá — Yucatán, México
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Chichen_Itza_3.jpg/500px-Chichen_Itza_3.jpg",
            nome: "Chichén Itzá",
            descricao: "Complexo maia famoso pela pirâmide de Kukulcán e por sua precisão astronômica.",
            latitude: 20.684285,
            longitude: -88.567783
        ),
        // 3. Coliseu — Roma, Itália
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Colosseo_2020.jpg/500px-Colosseo_2020.jpg",
            nome: "Coliseu",
            descricao: "Anfiteatro romano icônico, palco de espetáculos e símbolo da Roma Antiga.",
            latitude: 41.890210,
            longitude: 12.492231
        ),
        // 4. Machu Picchu — Cusco, Peru
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Machu_Picchu%2C_Peru.jpg/500px-Machu_Picchu%2C_Peru.jpg",
            nome: "Machu Picchu",
            descricao: "Cidade inca nos Andes, famosa por sua engenharia e paisagens espetaculares.",
            latitude: -13.163141,
            longitude: -72.544963
        ),
        // 5. Taj Mahal — Agra, Índia
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Taj-Mahal.jpg/500px-Taj-Mahal.jpg",
            nome: "Taj Mahal",
            descricao: "Mausoléu de mármore branco, símbolo de amor e uma obra-prima da arquitetura mogol.",
            latitude: 27.175015,
            longitude: 78.042155
        ),
        // 6. Grande Muralha da China — China
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/20090529_Great_Wall_8185.jpg/500px-20090529_Great_Wall_8185.jpg",
            nome: "Grande Muralha da China",
            descricao: "Imensa fortificação que se estende por milhares de quilômetros no norte da China.",
            latitude: 40.431908,
            longitude: 116.570374
        ),
        // 7. Petra — Jordânia
        Lugar(
            foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Al_Khazneh.jpg/500px-Al_Khazneh.jpg",
            nome: "Petra",
            descricao: "Cidade esculpida na rocha pelos nabateus, famosa pelo Tesouro (Al-Khazneh).",
            latitude: 30.328960,
            longitude: 35.444832
        )
    ]

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -22.951889, longitude: -43.210500),
            span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
        )
    )
    
    @State private var lugarSelecionado = Lugar (
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg/500px-Christ_the_Redeemer_-_Cristo_Redentor.jpg",
        nome: "Cristo Redentor",
        descricao: "Estátua de Jesus Cristo no topo do Corcovado, símbolo do Rio de Janeiro e do Brasil.",
        latitude: -22.951889,
        longitude: -43.210500
    )
    
    @State private var navegar = false
    
    var body: some View {
        NavigationStack {
            VStack{
                Map(position: $cameraPosition) {
                    ForEach(lugares) { lugar in
                        Annotation(
                            lugar.nome,
                            coordinate: CLLocationCoordinate2D(latitude: lugar.latitude, longitude: lugar.longitude)
                        ){
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                                .padding(5)
                                .onTapGesture {
                                    lugarSelecionado = lugar
                                    navegar = true
                                }
                        }
                    }
                }
                .ignoresSafeArea()
                .navigationDestination(isPresented: $navegar){
                    SheetView(lugar: lugarSelecionado)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
