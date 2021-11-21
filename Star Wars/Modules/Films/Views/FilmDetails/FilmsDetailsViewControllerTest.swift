//
//  FilmsDetailsViewControllerTest.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 21/11/21.
//

import XCTest
@testable import Star_Wars

class FilmsDetailsViewControllerTest: XCTestCase {
    var filmApiRepository: FilmsApiRepositoryMock!
    var filmsViewModel: IFilmsViewModel!
    var filmDetailsViewController: FilmDetailsViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        self.filmApiRepository = FilmsApiRepositoryMock()
        self.filmsViewModel = FilmsViewModel(filmRepository: filmApiRepository)
        self.filmDetailsViewController = FilmDetailsViewController(viewModel: filmsViewModel)
        self.filmDetailsViewController.loadView()
    }
    
    override func tearDown() {
        self.filmApiRepository = nil
        self.filmsViewModel = nil
        self.filmDetailsViewController = nil
        self.navigationController = nil
    }
    
    func test_tableViewCount_loadFilmsSuccessful() {
        self.filmApiRepository.getFilmsRespose = MockGetFilmsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.filmsViewModel.loadFilms().done {
            self.filmsViewModel.filmDetails = self.filmsViewModel.films[0]
            self.filmDetailsViewController.viewDidLoad()
            XCTAssertEqual(self.filmDetailsViewController.filmTitle.text,"The Empire Strikes Back")
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
}

