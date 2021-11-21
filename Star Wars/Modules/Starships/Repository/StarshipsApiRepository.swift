//
//  StarshipsApiRepository.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import PromiseKit

protocol IStarshipsApiRepository {
    func getStarships() -> Promise<GetStarshipsRespose>
}

class StarshipsApiRepository: IStarshipsApiRepository {
    
    func getStarships() -> Promise<GetStarshipsRespose> {
        NetworkManager.request(url: "http://swapi.dev/api/starships", method: .get)
    }

}

struct GetStarshipsRespose: Codable {
    let results: [Starship]
}
