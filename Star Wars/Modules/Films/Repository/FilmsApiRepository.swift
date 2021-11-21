//
//  FilmsApiRepository.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import PromiseKit

protocol IFilmsApiRepository {
    func getFilms() -> Promise<GetFilmsRespose>
}

class FilmsApiRepository: IFilmsApiRepository {
    
    func getFilms() -> Promise<GetFilmsRespose> {
        NetworkManager.request(url: "http://swapi.dev/api/films", method: .get)
        
    }

}

struct GetFilmsRespose: Codable {
    let results: [Film]
}
