//
//  Service.swift
//  app-com-api
//
//  Created by Turma02-5 on 03/06/26.
//

import Foundation
import Combine

struct Service {
    func fetchHapo(url: URL) -> AnyPublisher<[HaPo], Error>
    {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [HaPo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
