//
//  MenuBarUITests.swift
//  MenuBarUITests
//
//  Created by Oleksandr Bilous on 02.07.2023.
//

import XCTest
import guiverify

final class MenuBarUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication(url: URL(fileURLWithPath: "/Applications/Setapp.app"))
    }

    override func tearDownWithError() throws {
        app = .none
    }

    func testExample() throws {
        app.launch()
        _ = app.wait(for: .runningForeground, timeout: 10)
        let goMenu = app.menuBarItems["menu-bar-item.go-menu"]
        goMenu.click()
        goMenu.menus.firstMatch.menuItems["Favorites"].click()
    }
    
    func testExampleWithAccessibility() throws {
        app.launch()
        _ = app.wait(for: .runningForeground, timeout: 10)
        
        
        let goMenu =  try app.app.menuBars.firstMatch .menuBarItems["Go"]
        goMenu.click()
        goMenu.menus.firstMatch.menuItems["Favorites"].click()
    }
}

extension XCUIApplication {
    var app: GUIElement {
        get throws {
            let app = NSWorkspace.shared.runningApplications.first { $0.bundleIdentifier == "com.setapp.DesktopClient" }
            let pid = try XCTUnwrap(app?.processIdentifier)
            return GUIElement(uiElement: AXUIElementCreateApplication(pid))
        }
    }
}
