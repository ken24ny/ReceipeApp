//
//  Fetch_RewardsUITestsLaunchTests.swift
//  Fetch RewardsUITests
//
//  Created by Kentaro Umemoto on 9/27/21.
//

import XCTest

class Fetch_RewardsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()


        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
