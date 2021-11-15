//
//  RankingViewControllerTests.swift
//  UITestExampleUITests
//
//  Created by hm kim on 2021/11/14.
//

import XCTest
@testable import UITestExample

final class RankingViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }

    func test_rankingViewController() {
        let app = XCUIApplication()
        let rankingButton = app.buttons["랭킹"]
        rankingButton.tap()

        let backButton = app.navigationBars["랭킹"].buttons["Back"]
        backButton.tap()

        rankingButton.tap()
        backButton.tap()
        rankingButton.tap()
    }

    func test_reankingViewController_when_containAdPurchase() {
        let app = XCUIApplication()
        let rankingButton = app.buttons["랭킹"]
        rankingButton.tap()

        let creamButton = app.buttons["크림"]
        creamButton.tap()

        let adPurchaseCell = app.tables.cells.element(boundBy: 0).staticTexts["추천"]
        XCTAssertTrue(adPurchaseCell.exists)

        let firstPlaceProductCell = app.tables.cells.element(boundBy: 1).staticTexts["1등"]
        XCTAssertTrue(firstPlaceProductCell.exists)

        let recommendCell = app.tables.cells.containing(.staticText, identifier: "추천")
        XCTAssertTrue(recommendCell.element.exists)
        XCTAssertEqual(recommendCell.count, 1)

//        XCTAssertTrue(app.tables.cells.matching(identifier: "추천").element.exists)
    }

    func test_rankingViewController_when_notContainAdPurchase() {
        let app = XCUIApplication()
        let rankingButton = app.buttons["랭킹"]
        rankingButton.tap()

        let adPurchaseCell = app.tables.cells.element(boundBy: 0).staticTexts["추천"]
        XCTAssertFalse(adPurchaseCell.exists)

        let firstPlaceProductCell = app.tables.cells.element(boundBy: 0).staticTexts["1등"]
        XCTAssertTrue(firstPlaceProductCell.exists)

        let recommendCell = app.tables.cells.containing(.staticText, identifier: "추천")
        XCTAssertFalse(recommendCell.element.exists)
    }
}
