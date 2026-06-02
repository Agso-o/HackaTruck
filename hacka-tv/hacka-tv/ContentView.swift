//
//  ContentView.swift
//  hacka-tv
//
//  Created by Turma02-5 on 01/06/26.
//

import SwiftUI

struct Conteudo: Hashable {
    let categoria: String
    let nome: String
    var capa: String
    let ano: String
    let genero: String
    let pais: String
    let imdb: Double
}

struct ImageView: View {
    var body: some View {
        ZStack {
            Rectangle().fill(.gray.gradient)
        }
    }
}

struct ElementView: View {
    let conteudo: Conteudo
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: conteudo.capa)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            } placeholder: {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 80, height: 120)
                    .overlay(ProgressView())
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(conteudo.nome)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                HStack(spacing: 8) {
                    Text(conteudo.categoria)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text("•")

                    Text(conteudo.ano)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text("•")

                    Text(conteudo.genero)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .lineLimit(1)

                HStack(spacing: 10) {
                    Text(conteudo.pais)
                        .font(.title3)

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f", conteudo.imdb))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 0.5)
        )
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

struct ContentView: View {
    @State var arrayConteudos: [Conteudo] = [
        Conteudo(categoria: "Serie", nome: "Em busca da casa automatica", capa: "https://m.media-amazon.com/images/M/MV5BNWYzZTEwZGItYTYwOC00MTE1LTg2M2EtYjRkMTM4NDEyZTUxXkEyXkFqcGc@._V1_QL75_UX380_CR0,4,380,562_.jpg", ano: "2013", genero: "Aventura", pais: "🇧🇷", imdb: 9.5),
        Conteudo(categoria: "Filme", nome: "Homem-Aranha", capa: "https://m.media-amazon.com/images/M/MV5BZWM0OWVmNTEtNWVkOS00MzgyLTkyMzgtMmE2ZTZiNjY4MmFiXkEyXkFqcGc@._V1_FMjpg_UX511_.jpg", ano: "2002", genero: "Acao", pais: "🇺🇸", imdb: 7.4)
    ]
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gray, .white],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            VStack{
                Image("ufpi-tv")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(.horizontal)
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        
                        Text("Séries")
                            .font(.title2).bold()
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            ForEach(arrayConteudos.filter { $0.categoria == "Serie" }, id: \.self) { conteudo in
                                ElementView(conteudo: conteudo)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.vertical, 8)
                        
                        Text("Filmes")
                            .font(.title2).bold()
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            ForEach(arrayConteudos.filter { $0.categoria == "Filme" }, id: \.self) { conteudo in
                                ElementView(conteudo: conteudo)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
