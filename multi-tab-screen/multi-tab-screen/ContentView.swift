//
//  ContentView.swift
//  multi-tab-screen
//
//  Created by Turma02-5 on 29/05/26.
//

import SwiftUI
struct RosaView: View {
    var body: some View {
        ZStack{
            Color(.pink)
                .ignoresSafeArea()
            Circle().scaledToFit().padding(30)
            Image(systemName: "paintbrush")
                .resizable()
                .scaledToFit()
                .foregroundColor(.pink)
                .padding(80)
        }
        .padding(.bottom)
    }
}

struct AzulView: View {
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            Circle().scaledToFit().padding(30)
            Image(systemName: "paintbrush.pointed")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                .padding(80)
        }
        .padding(.bottom)
    }
}

struct CinzaView: View {
    var body: some View {
        ZStack{
            Color(.gray)
                .ignoresSafeArea()
            Circle().scaledToFit().padding(30)
            Image(systemName: "paintpalette")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .padding(80)
        }
        .padding(.bottom)
    }
}

struct ListaView: View{
    var body: some View {
        ZStack{
            VStack{
                List{
                    Section(){
                        HStack{
                            Text("Rosa")
                            Spacer()
                            Image(systemName: "paintbrush")
                        }
                        HStack{
                            Text("Azul")
                            Spacer()
                            Image(systemName: "paintbrush.pointed")
                        }
                        HStack{
                            Text("Cinza")
                            Spacer()
                            Image(systemName: "paintpalette")
                        }
                    } header: {
                        Text("List")
                            .font(.title)
                            .bold()
                    }
                    .headerProminence(.increased)
                    
                }
            }
        }
        .padding(.bottom)
    }
}



struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Tab("Rosa", systemImage: "paintbrush"){
                    RosaView()
                }
                Tab("Azul", systemImage: "paintbrush.pointed"){
                    AzulView()
                }
                Tab("Cinza", systemImage: "paintpalette.fill"){
                    CinzaView()
                }
                Tab("Lista", systemImage: "list.bullet"){
                    ListaView()
                        .navigationTitle("List")
                }
            
            }
        }
        }
        
}

#Preview {
    ContentView()
}
