//
//  FilmsListViewControllerTest.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 21/11/21.
//

import XCTest
@testable import Star_Wars

class FilmsListViewControllerTest: XCTestCase {
    var filmApiRepository: FilmsApiRepositoryMock!
    var filmsViewModel: IFilmsViewModel!
    var filmsListViewController: FilmsListViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        self.filmApiRepository = FilmsApiRepositoryMock()
        self.filmsViewModel = FilmsViewModel(filmRepository: filmApiRepository)
        self.filmsListViewController = FilmsListViewController(viewModel: filmsViewModel)
        self.navigationController = UINavigationController(rootViewController: filmsListViewController)
        self.filmsListViewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.filmApiRepository = nil
        self.filmsViewModel = nil
        self.filmsListViewController = nil
        self.navigationController = nil
    }
    
    func test_tableViewCount_loadFilmsSuccessful() {
        self.filmApiRepository.getFilmsRespose = MockGetFilmsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.filmsViewModel.loadFilms().done {
            let count = self.filmsListViewController.tableView(self.filmsListViewController.filmsTableView, numberOfRowsInSection: 0)
            XCTAssertEqual(count, 2)
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_cellForRowAt_loadFilmsSuccessful() {
        self.filmApiRepository.getFilmsRespose = MockGetFilmsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.filmsViewModel.loadFilms().done {
            let cell = self.filmsListViewController.tableView(self.filmsListViewController.filmsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! FilmsTableViewCell
            XCTAssertEqual(cell.title.text, "The Empire Strikes Back")
            XCTAssertEqual(cell.releaseDate.text, "17/05/1980")
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_didSelectRowAt_loadFilmsSuccessful() {
        self.filmApiRepository.getFilmsRespose = MockGetFilmsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.filmsViewModel.loadFilms().done {
            self.filmsListViewController.tableView(self.filmsListViewController.filmsTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
        let topViewController = self.navigationController.topViewController
        XCTAssertTrue(topViewController.self is FilmDetailsViewController)
    }
    
}
