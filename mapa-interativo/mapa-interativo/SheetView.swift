//
//  SheetView.swift
//  mapa-interativo
//
//  Created by Turma02-5 on 02/06/26.
//

import SwiftUI


struct SheetView: View {
    let lugar: Lugar
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: lugar.foto)){ image in
                image
                    .image?.resizable()
                    .frame(width: 250, height: 300)
            }
            Text(lugar.nome)
            Text(lugar.descricao)
        }
    }
}

#Preview {
    SheetView(lugar:  Lugar (
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg/500px-Christ_the_Redeemer_-_Cristo_Redentor.jpg",
        nome: "Cristo Redentor",
        descricao: "Estátua de Jesus Cristo no topo do Corcovado, símbolo do Rio de Janeiro e do Brasil.",
        latitude: -22.951889,
        longitude: -43.210500
    ))
}
