//
//  StarshipsApiRepositoryMock.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 20/11/21.
//

import PromiseKit
@testable import Star_Wars

class StarshipsApiRepositoryMock: IStarshipsApiRepository {
    
    var getStarshipsRespose: GetStarshipsRespose = MockGetStarshipsRespose.success
    
    func getStarships() -> Promise<GetStarshipsRespose> {
        return Promise<GetStarshipsRespose> { seal in
            seal.fulfill(getStarshipsRespose)
        }
    }
    
}

struct MockGetStarshipsRespose {
    static let success = GetStarshipsRespose(results: [
        Starship(name: "CR90 corvette",
                 model: "CR90 corvette",
                 manufacturer: "Corellian Engineering Corporation",
                 costInCredits: "3500000",
                 length: "150",
                 maxAtmospheringSpeed: "950",
                 crew: "30-165",
                 passengers: "600",
                 cargoCapacity: "3000000",
                 consumables: "1 year",
                 hyperdriveRating: "2.0",
                 MGLT: "60",
                 starshipClass: "corvette",
                 created: "2014-12-10T14:20:33.369000Z",
                 edited: "2014-12-20T21:23:49.867000Z"),
        Starship(name: "CR90 corvette",
                 model: "CR90 corvette",
                 manufacturer: "Corellian Engineering Corporation",
                 costInCredits: "3500000",
                 length: "10",
                 maxAtmospheringSpeed: "950",
                 crew: "30-165",
                 passengers: "600",
                 cargoCapacity: "3000000",
                 consumables: "1 year",
                 hyperdriveRating: "2.0",
                 MGLT: "60",
                 starshipClass: "corvette",
                 created: "2014-12-10T14:20:33.369000Z",
                 edited: "2014-12-20T21:23:49.867000Z"),
    ])
    static let empty = GetStarshipsRespose(results: [])
}
