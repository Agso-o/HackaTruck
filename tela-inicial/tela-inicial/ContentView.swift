//
//  ContentView.swift
//  tela-inicial
//
//  Created by Turma02-5 on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("FullMetal Alchemist")
            HStack{
                Image("Roy")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                Text("O melhor anime de todos os tempos")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
