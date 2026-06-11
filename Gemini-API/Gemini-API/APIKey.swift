//
//  APIKey.swift
//  Gemini-API
//
//  Created by Turma02-5 on 09/06/26.
//

import Foundation

enum APIKey {
    static var `default`: String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY não encontrada no Info.plist")
        }
        
        // Remove espaços em branco ou quebras de linha acidentais
        return value.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
