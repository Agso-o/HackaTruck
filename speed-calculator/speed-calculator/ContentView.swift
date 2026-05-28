//
//  ContentView.swift
//  speed-calculator
//
//  Created by Turma02-5 on 28/05/26.
//

import SwiftUI

var img: String = "interrogacao"
var vel: Double = 0
var corFundo: Color = .gray

func changeImage(tempo: Double, distancia: Double) -> Void {
    vel = distancia / tempo
    if(vel <= 9.9){
        img = "tartaruga"
        corFundo = .verdeClaro
        return
    }
    if(vel <= 29.9){
        img = "elefante"
        corFundo = .azulClaro
        return
    }
    if(vel <= 69.9){
        img = "avestruz"
        corFundo = .laranjaClaro
        return
    }
    if(vel <= 89.9){
        img = "leao"
        corFundo = .amareloClaro
        return
    }
    img = "guepardo"
    corFundo = .vermelhoClaro
}

struct ContentView: View {
    @State private var botao = false
    @State private var dist: Double = 0
    @State private var time: Double = 0
    @State private var cor: Color = .gray
    @State private var velocidade: Double = 0
    @State private var imagem: String = "interrogacao"
    var body: some View {
        ZStack{
            Color(cor)
                .ignoresSafeArea()
            VStack {
                Text("Digite adistâ0cia (km):")
                TextField("0",value: $dist, format: .number)
                    .cornerRadius(12)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 70)
                Text("Digite o tempo (h):")
                TextField("0",value: $time, format: .number)
                    .cornerRadius(12)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 70)
                Button("Calcular"){
                    changeImage(tempo: time, distancia: dist)
                    imagem = img
                    velocidade = vel
                    cor = corFundo
                }
                .buttonStyle(.bordered)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(100)
                .font(.callout)
                .fontDesign(.monospaced)
                .shadow(color: cor, radius: 15, y: 19)
                Text("\(velocidade, format: .number.precision(.fractionLength(2))) km/h").font(.largeTitle)
                Image(imagem)
                    .resizable()
                    .clipShape(Circle())
                    .padding()
                
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
                            .fill(.azulClaro)
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
