//
//  LoginPageUITests.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 09/03/25.
//

import XCTest

class test_login_screen : XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() { 
        app = XCUIApplication()
        app.launch()
    }
    
    
    func test_login_screen_invalid_email_address() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        let loginFlag = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        XCTAssertEqual(loginFlag, false)
                
        let txtEmail = app.textFields["login_page_txtEmail"]
        txtEmail.tap()
        sleep(1)
        txtEmail.typeText("qwe@e")
                 
        let errorMessage = app.staticTexts["login_page_error_message"]
        
        XCTAssert(errorMessage.waitForExistence(timeout: 3))
    }
    
    func test_login_screen_invalid_password() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        let loginFlag = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        XCTAssertEqual(loginFlag, false)
                 
        let txtPassword = app.textFields["login_page_txtPassword"]
        txtPassword.tap()
        sleep(1)
        txtPassword.typeText("123")
        
        let errorMessage = app.staticTexts["login_page_error_message"]
        
        XCTAssert(errorMessage.waitForExistence(timeout: 3))
    }
    
    func test_login_screen_valid_email_and_password() {
//        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
//        let loginFlag = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
//        
//        XCTAssertEqual(loginFlag, false)
        
        let txtEmail = app.textFields["login_page_txtEmail"]
        txtEmail.tap()
        sleep(1)
        txtEmail.typeText("Shubham@mail.com")
        
        let txtPassword = app.textFields["login_page_txtPassword"]
        txtPassword.tap()
        sleep(1)
        txtPassword.typeText("123456")
        
        let btnLogin = app.buttons["login_page_login_btn"]
        btnLogin.tap()
        
        let dashboardNavTitle = app.staticTexts["Bapu Store LLC"]
        XCTAssert(dashboardNavTitle.waitForExistence(timeout: 4))
        
    }
    
    
}
