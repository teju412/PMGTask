//
//  StarshipListViewController.swift
//  Star WarsTests
//
//  Created by TejaDanasvip on 21/11/21.
//

import XCTest
@testable import Star_Wars

class StarshipListViewController: XCTestCase {
    var starshipApiRepository: StarshipsApiRepositoryMock!
    var starshipsViewModel: IStarshipsViewModel!
    var starshipsListViewController: StarshipsListViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        self.starshipApiRepository = StarshipsApiRepositoryMock()
        self.starshipsViewModel = StarshipsViewModel(starshipRepository: starshipApiRepository)
        self.starshipsListViewController = StarshipsListViewController(viewModel: starshipsViewModel)
        self.navigationController = UINavigationController(rootViewController: starshipsListViewController)
        self.starshipsListViewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.starshipApiRepository = nil
        self.starshipsViewModel = nil
        self.starshipsListViewController = nil
        self.navigationController = nil
    }
    
    func test_tableViewCount_loadStarshipsSuccessful() {
        self.starshipApiRepository.getStarshipsRespose = MockGetStarshipsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.starshipsViewModel.loadStarships().done {
            let count = self.starshipsListViewController.tableView(self.starshipsListViewController.starshipsTableView, numberOfRowsInSection: 0)
            XCTAssertEqual(count, 2)
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_cellForRowAt_loadStarshipsSuccessful() {
        self.starshipApiRepository.getStarshipsRespose = MockGetStarshipsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.starshipsViewModel.loadStarships().done {
            let cell = self.starshipsListViewController.tableView(self.starshipsListViewController.starshipsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! StarshipsTableViewCell
            XCTAssertEqual(cell.name.text, "CR90 corvette")
            XCTAssertEqual(cell.length.text, "10")
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_didSelectRowAt_loadStarshipsSuccessful() {
        self.starshipApiRepository.getStarshipsRespose = MockGetStarshipsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.starshipsViewModel.loadStarships().done {
            self.starshipsListViewController.tableView(self.starshipsListViewController.starshipsTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
        let topViewController = self.navigationController.topViewController
        XCTAssertTrue(topViewController.self is StarshipDetailsViewController)
    }
    
}
