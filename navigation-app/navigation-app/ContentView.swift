//
//  ContentView.swift
//  navigation-app
//
//  Created by Turma02-5 on 29/05/26.
//

import SwiftUI

struct IconView: View {
    let cor: Color
    let imagem: String
    let texto: String

    var body: some View {
        ZStack {
            cor
                .ignoresSafeArea()
            Circle()
                .scaledToFit()
                .padding(30)
            VStack {
                Image(systemName: imagem)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(cor)
                    .padding(80)
                Text(texto)
            }
        }
    }
}

struct ListaView: View {
    let texto: String

    var body: some View {
        ZStack {
            VStack {
                List {
                    Section {
                        HStack {
                            Text("Rosa")
                            Spacer()
                            Image(systemName: "paintbrush")
                        }
                        HStack {
                            Text("Azul")
                            Spacer()
                            Image(systemName: "paintbrush.pointed")
                        }
                        HStack {
                            Text("Cinza")
                            Spacer()
                            Image(systemName: "paintpalette")
                        }
                    }
                    header: {
                        Text("List")
                            .font(.title)
                            .bold()
                    }
                    .headerProminence(.increased)
                    footer:  do {
                        Text(texto)
                            .font(.callout)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var texto: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("Menu de cores")
                    .font(.title)
                    .bold()

                TextField("", text: $texto)
                    .multilineTextAlignment(.center)

                HStack {
                    NavigationLink(destination: IconView(cor: .pink, imagem: "paintbrush", texto: texto)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.pink)
                            Image(systemName: "paintbrush")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        .frame(width: 150, height: 150)
                    }
                    NavigationLink(destination: IconView(cor: .blue, imagem: "paintbrush.pointed", texto: texto)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.blue)
                            Image(systemName: "paintbrush.pointed")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        .frame(width: 150, height: 150)
                    }
                }

                HStack {
                    NavigationLink(destination: IconView(cor: .gray, imagem: "paintpalette", texto: texto)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.gray)
                            Image(systemName: "paintpalette")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        .frame(width: 150, height: 150)
                    }
                    NavigationLink(destination: ListaView(texto: texto)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.purple)
                            Image(systemName: "list.bullet")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        .frame(width: 150, height: 150)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
