//
//  ContentView.swift
//  speed-calculator
//
//  Created by Turma02-5 on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var imagem: String = "interrogacao"
    @State private var dist: String = ""
    @State private var time: Double = 0
    @State private var cor: Color = .gray
    @State private var velocidade: Double = 0.0
    var body: some View {
        ZStack{
            Color(cor)
                .ignoresSafeArea()
            VStack {
                Text("Digite adistância (km):")
                TextField("0", text: $dist)
                    .textFieldStyle(.roundedBorder)
                Text("Digite o tempo (h):")
                TextField("0", value: $time, format: .number)
                    .textFieldStyle(.roundedBorder)
                Button("Calcular"){
                    
                }.buttonStyle(.glass).font(.callout).fontDesign(.monospaced)
                Text("\(velocidade) km/h").font(.largeTitle)
                
                
                VStack{
                    HStack{
                        Text("Tartaruga (0 - 9.9km/h)")
                        Circle()
                            .fill(.verdeClaro)
                            .frame(width: 14)
                    }
                    HStack{
                        Text("Elefante (10km/h - 29.9km/h)")
                        Circle()
                            .fill(.blue)
                            .frame(width: 14)
                    }
                    HStack{
                        Text("Avestruz (30km/h - 69.9km/h)")
                        Circle()
                            .fill(.laranjaClaro)
                            .frame(width: 14)
                    }
                    
                    HStack{
                        Text("Leao (70km/h - 89.9km/h)")
                        Circle()
                            .fill(.amareloClaro)
                            .frame(width: 14)
                    }
                    HStack{
                        Text("Guepardo (90km/h - 130km/h)")
                        Circle()
                            .fill(.vermelhoClaro)
                            .frame(width: 14)
                    }
                    
                    
                        
                }
                .padding()
                .background(.black)
                .cornerRadius(20)
                .foregroundColor(.white)
            }
            .padding()
        }
    }
    
}

#Preview {
    ContentView()
}
