//
//  FilmsViewModelTest.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 21/11/21.
//

import XCTest
@testable import Star_Wars

class FilmsViewModelTest: XCTestCase {
    var filmApiRepository: FilmsApiRepositoryMock!
    var filmsViewModel: IFilmsViewModel!

    override func setUp() {
        self.filmApiRepository = FilmsApiRepositoryMock()
        self.filmsViewModel = FilmsViewModel(filmRepository: filmApiRepository)
    }

    override func tearDown() {
        self.filmApiRepository = nil
        self.filmsViewModel = nil
    }

    func test_loadFilms_successfully() {
        self.filmApiRepository.getFilmsRespose = MockGetFilmsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.filmsViewModel.loadFilms().done {
            XCTAssertEqual(self.filmsViewModel.films.count, 2)
            XCTAssertEqual(self.filmsViewModel.filmsTableData.count, 2)
            XCTAssertEqual(Int(self.filmsViewModel.films[0].episodeId), 5)
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
}
