//
//  Challenge_Milestones_Project4_6UITestsLaunchTests.swift
//  Challenge-Milestones-Project4-6UITests
//
//  Created by Lê Hồng Thắng on 16/6/26.
//

import XCTest

final class Challenge_Milestones_Project4_6UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
