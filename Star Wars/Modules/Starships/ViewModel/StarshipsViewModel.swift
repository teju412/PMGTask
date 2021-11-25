//
//  StarshipsViewModel.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import Foundation
import PromiseKit

protocol IStarshipsViewModel {
    var starships: [Starship] { get set }
    var starshipDetails: Starship? { get set }
    var starshipsTableData: [StarshipsTableViewCellViewModel] { get set }
    
    func loadStarships() -> Promise<Void>
}

final class StarshipsViewModel: IStarshipsViewModel {
    
    var starships: [Starship] = []
    var starshipDetails: Starship?
    var starshipsTableData: [StarshipsTableViewCellViewModel] = []
    
    let starshipRepository: IStarshipsApiRepository 
    
    init(starshipRepository: IStarshipsApiRepository = StarshipsApiRepository()) {
        self.starshipRepository = starshipRepository
    }
    
    
    @discardableResult func loadStarships() -> Promise<Void> {
        starshipRepository.getStarships()
            .done { self.assignStarships(response: $0) }
            .done { self.sortStarshipsShortestFirst() }
            .done { self.assignStarshipsTableData() }
    }
    
    fileprivate func assignStarships(response: GetStarshipsRespose) {
        self.starships = response.results
    }
    
    fileprivate func assignStarshipsTableData() {
        self.starshipsTableData = self.starships.map { starship in
            return StarshipsTableViewCellViewModel(name: starship.name, length: starship.length)
        }
    }
    
    fileprivate func sortStarshipsShortestFirst() {
        self.starships = self.starships.sorted(by: {
            guard let firstStarship = Float($0.length.replacingOccurrences(of: ",", with: "")),
                  let secondStarship = Float($1.length.replacingOccurrences(of: ",", with: "")) else { return false }
            return firstStarship < secondStarship
        })
    }
}
