//
//  StarshipsViewModelTest.swift
//  Star WarsTests
//
//  Created by TejaDanasvi on 20/11/21.
//

import XCTest
@testable import Star_Wars

class StarshipsViewModelTest: XCTestCase {
    var starshipApiRepository: StarshipsApiRepositoryMock!
    var starshipsViewModel: IStarshipsViewModel!

    override func setUp() {
        self.starshipApiRepository = StarshipsApiRepositoryMock()
        self.starshipsViewModel = StarshipsViewModel(starshipRepository: starshipApiRepository)
    }

    override func tearDown() {
        self.starshipApiRepository = nil
        self.starshipsViewModel = nil
    }

    func test_loadStarships_successfully() {
        self.starshipApiRepository.getStarshipsRespose = MockGetStarshipsRespose.success
        let expectation = expectation(description: "api called successfully")
        self.starshipsViewModel.loadStarships().done {
            XCTAssertEqual(self.starshipsViewModel.starships.count, 2)
            XCTAssertEqual(self.starshipsViewModel.starshipsTableData.count, 2)
            XCTAssertEqual(Int(self.starshipsViewModel.starships[0].length), 10)
            expectation.fulfill()
        }.catch { _ in
            XCTFail()
        }
        waitForExpectations(timeout: 3)
    }
}
