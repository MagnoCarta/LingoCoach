//
//  DetailsUITests.swift
//  LingoCoachUITests
//
//  Created by Vitor Bryan on 30/11/20.
//

import XCTest

class DetailsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEditView() {
        
        let app = XCUIApplication()
        app.collectionViews.cells.firstMatch.tap()
        
        let editButton = app.navigationBars["Nota 1"].buttons["Editar"]
        XCTAssertTrue(editButton.exists)
        editButton.tap()
        
        let saveButton = app.navigationBars["Notas"].buttons["Salvar"]
        XCTAssertTrue(saveButton.exists)
    }

}
