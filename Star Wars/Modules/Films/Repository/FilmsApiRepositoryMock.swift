//
//  FilmsApiRepositoryMock.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 21/11/21.
//

import PromiseKit
@testable import Star_Wars

class FilmsApiRepositoryMock: IFilmsApiRepository {
    
    var getFilmsRespose: GetFilmsRespose = MockGetFilmsRespose.success
    
    func getFilms() -> Promise<GetFilmsRespose> {
        return Promise<GetFilmsRespose> { seal in
            seal.fulfill(getFilmsRespose)
        }
    }
    
}

struct MockGetFilmsRespose {
    static let success = GetFilmsRespose(results: [
        Film(title: "A New Hope",
             episodeId: 4,
             openingCrawl: "It is a period of civil war",
             director: "George Lucas",
             producer: "Gary Kurtz, Rick McCallum",
             releaseDate: "1977-05-25"),
        Film(title: "The Empire Strikes Back",
             episodeId: 5,
             openingCrawl: "It is a period of civil war",
             director: "George Lucas",
             producer: "Gary Kurtz, Rick McCallum",
             releaseDate: "1980-05-17"),
        
    ])
    static let empty = GetStarshipsRespose(results: [])
}
