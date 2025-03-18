//
//  LandingPageUITest.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 09/03/25.
//

import XCTest

class test_landing_page : XCTestCase {
    
    var app : XCUIApplication!
    
    override  func setUp() {
        app = XCUIApplication()
        self.app.launch()
    }
    
    func test_launch_landing_page() {
        
        let landingText = app.staticTexts["landing_page_welcome_text"]
        XCTAssertEqual(landingText.exists,true)
        
    }
    
    
    func test_navigate_to_login_screen() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        sleep(1)
        let loginFlag = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        XCTAssertEqual(loginFlag, false)
        
        let landingText = app.buttons["login_page_login_btn"]
        
        XCTAssert(landingText.waitForExistence(timeout: 3))
    }
    
    
    func test_navigate_to_dashboard_screen() {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        sleep(1)
        let loginFlag = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        XCTAssertEqual(loginFlag, true)
        
        let dashboardNavTitle = app.staticTexts["Bapu Store LLC"]
        XCTAssert(dashboardNavTitle.waitForExistence(timeout: 4)) 
    }
      
    
}
