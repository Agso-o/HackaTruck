//
//  PersonagemView.swift
//  app-com-api
//
//  Created by Turma02-5 on 03/06/26.
//

import SwiftUI

struct PersonagemView: View {
    let personagem: HaPo
    var body: some View {
        ZStack{
            Image("grifino")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                .ignoresSafeArea()
            VStack{
                if URL(string: personagem.image!) != nil {
                    AsyncImage(url: URL(string: personagem.image!)) { image in
                        image
                            .image?.resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(.circle)
                    }
                    VStack{
                        Text("House: \(personagem.house ?? "")")
                            
                        Text("Name: \(personagem.name ?? "")")
                        Text("Birth: \(personagem.dateOfBirth ?? "")")
                        Text("Eyes: \(personagem.eyeColour ?? "")")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300)
                    .background(Color.wine)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                }
                
            }
            .padding(.bottom, 40)
        }
    }
}
