//
//  ContentView.swift
//  greetings-screen
//
//  Created by Turma02-5 on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var button = false

    var body: some View {
        ZStack{
            Image("BackGround")
                .resizable()
            VStack {
                Text("Bem Vindo Ao SIAC")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .scaledToFit()
                Image("SIAC")
                    .resizable()
                    .scaledToFit()
                    .padding()
                TextField("Nome: ", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button("Enter"){
                    button = true
                }
                .frame(width: 80, height: 40)
                .font(.callout)
                .scaledToFit()
                .fontDesign(.monospaced)
                .cornerRadius(15)
                .background(.green)
                .foregroundColor(.white)
                .alert("Atenço \(name)",
                       isPresented: $button,
                       actions:{},
                        message:{
                    Text("Você está prestes a conhecer o melhor evento tech do Piauí")
                })
            }
            .padding()
            .padding(.bottom, 180)
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
