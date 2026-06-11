//
//  ContentView.swift
//  Gemini-API
//
//  Created by Turma02-5 on 09/06/26.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default)
    
    @State var textInput = ""
    @State var aiResponse = "Olá! Digite uma palavra ou frase para traduzir e entender o contexto."
    @State var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Assistente de Idiomas 🌎")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Área de exibição da resposta
            ScrollView {
                Text(aiResponse)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
            }
            
            // Indicador de carregamento
            if isLoading {
                ProgressView("Consultando o professor...")
            }
            
            // Área de digitação e botão de envio
            HStack {
                TextField("Digite a palavra ou frase...", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        if !textInput.isEmpty && !isLoading {
                            sendMessage()
                        }
                    }
                
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding(10)
                        .background(textInput.isEmpty || isLoading ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .disabled(textInput.isEmpty || isLoading)
            }
            .padding(.bottom)
        }
        .padding()
    }
    
    // Função assíncrona para chamar a API
    func sendMessage() {
        // Criamos um prompt guiado para garantir o formato da resposta da IA
        let prompt = "Atue como um professor de idiomas. Traduza a seguinte entrada, explique brevemente a gramática ou estrutura e dê um exemplo de uso em uma frase natural: '\(textInput)'"
        
        isLoading = true
        let currentInput = textInput
        textInput = ""
        
        Task {
            do {
                let response = try await model.generateContent(prompt)
                guard let text = response.text else {
                    aiResponse = "Desculpe, não consegui processar isso.\nTente novamente."
                    isLoading = false
                    return
                }
                aiResponse = "Entrada: \(currentInput)\n\n\(text)"
                isLoading = false
            } catch {
                aiResponse = "Algo deu errado!\n\(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
