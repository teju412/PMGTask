//
//  StarshipDetailsViewControllerTest.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 21/11/21.
//

import XCTest
@testable import Star_Wars

class StarshipDetailsViewControllerTest: XCTestCase {
    var starshipApiRepository: StarshipsApiRepositoryMock!
    var starshipsViewModel: IStarshipsViewModel!
    var starshipDetailsViewController: StarshipDetailsViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        self.starshipApiRepository = StarshipsApiRepositoryMock()
        self.starshipsViewModel = StarshipsViewModel(starshipRepository: starshipApiRepository)
        self.starshipDetailsViewController = StarshipDetailsViewController(viewModel: starshipsViewModel)
        self.starshipDetailsViewController.loadView()
    }
    
    override func tearDown() {
        self.starshipApiRepository = nil
        self.starshipsViewModel = nil
        self.starshipDetailsViewController = nil
        self.navigationController = nil
    }
    
    func test_tableViewCount_loadStarshipsSuccessful() {
        self.starshipApiRepository.getStarshipsRespose = MockGetStarshipsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.starshipsViewModel.loadStarships().done {
            self.starshipsViewModel.starshipDetails = self.starshipsViewModel.starships[0]
            self.starshipDetailsViewController.viewDidLoad()
            XCTAssertEqual(self.starshipDetailsViewController.name.text,"CR90 corvette")
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
}
