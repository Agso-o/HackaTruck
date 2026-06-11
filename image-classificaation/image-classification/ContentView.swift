//
//  ContentView.swift
//  image-classificaation
//
//  Created by Turma02-5 on 10/06/26.
//

import SwiftUI
import Vision
import CoreML

struct ContentView: View {
    
    @State private var classificationLabel = "Pronto para analisar"
    @State private var selectedImage: UIImage?
    
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack (spacing: 20){
                VStack(spacing: 8){
                    Text("MobileNet")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text("Classificador de Imagens")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Image("elefante")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 8)
                    )
                    .padding()
                    .shadow(color: .black.opacity(0.3) ,radius: 8)
                VStack{
                    HStack{
                        Image(systemName: "text.page.badge.magnifyingglass")
                            .foregroundColor(.blue)
                        Text("resultado da analise")
                    }
                    Divider()
                    Text(classificationLabel)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                Spacer()
                Button(action: classifyImage) {
                    Text("Classificar imagem")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }.padding()
        }
    }
    
    func classifyImage() {
        selectedImage = UIImage(named: "elefante")
        guard let uiImage = selectedImage,
              let ciImage = CIImage(image: uiImage) else {
            classificationLabel = "Erro ao converter imagem"
            return
        }

        do {

            let model = try VNCoreMLModel(
                for: MobileNetV2(configuration: MLModelConfiguration()).model
            )

            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        classificationLabel = "Identificado: \(topResult.identifier) (\(String(format: "%.2f", topResult.confidence * 100))%)"
                    }
                } else {
                    classificationLabel = "Nenhum resultado encontrado"
                }
            }

            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            DispatchQueue.global().async {
                do {
                    try handler.perform([request])
                } catch {
                    classificationLabel = "Erro na classificação: \(error.localizedDescription)"
                }
            }

        } catch {
            classificationLabel = "Falha ao carregar modelo ML"
        }
    }
}

#Preview {
    ContentView()
}
