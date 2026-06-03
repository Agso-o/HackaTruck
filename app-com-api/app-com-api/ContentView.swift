//
//  ContentView.swift
//  app-com-api
//
//  Created by Turma02-5 on 03/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.wine.ignoresSafeArea()
                VStack{
                    Image("grifi")
                        .resizable()
                        .frame(height: 300)
                    ScrollView{
                        ForEach(viewModel.personagens){ personagem in
                            NavigationLink(destination: PersonagemView(personagem: personagem)) {
                                HStack{
                                    if URL(string: personagem.image!) != nil {
                                        AsyncImage(url: URL(string: personagem.image!)) { image in
                                            image
                                                .image?.resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height: 100)
                                                .clipShape(.circle)
                                        }
                                        Text(personagem.name!)
                                            .foregroundColor(.orange)
                                        Spacer()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear(){
                viewModel.fetch()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

