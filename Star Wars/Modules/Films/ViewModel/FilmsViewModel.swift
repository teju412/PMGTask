//
//  FilmsViewModel.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import Foundation
import PromiseKit

protocol IFilmsViewModel {
    var films: [Film] { get set }
    var filmDetails: Film? { get set }
    var filmsTableData: [FilmsTableViewCellViewModel] { get set }
    
    func loadFilms() -> Promise<Void>
}

final class FilmsViewModel: IFilmsViewModel {
    
    var films: [Film] = []
    var filmDetails: Film?
    var filmsTableData: [FilmsTableViewCellViewModel] = []
    
    let filmRepository: IFilmsApiRepository
    
    init(filmRepository: IFilmsApiRepository = FilmsApiRepository()) {
        self.filmRepository = filmRepository
    }
    
    
    @discardableResult func loadFilms() -> Promise<Void> {
        filmRepository.getFilms()
            .done { self.assignFilms(response: $0) }
            .done { self.sortFilmsLatestFirst() }
            .done { self.assignFilmsTableData() } //functional programming principles
    }
    
    fileprivate func assignFilms(response: GetFilmsRespose) {
        self.films = response.results
    }
    
    fileprivate func assignFilmsTableData() {
        self.filmsTableData = self.films.map { film in
            return FilmsTableViewCellViewModel(title: film.title, releaseDate: film.releaseDate)
        }
    }
    
    fileprivate func sortFilmsLatestFirst() {
        self.films = self.films.sorted(by: {
            $0.releaseDate > $1.releaseDate
        })
    }
}
