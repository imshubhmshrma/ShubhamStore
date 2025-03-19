//
//  LoginScreen.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 17/02/25.
//

import SwiftUI

struct LoginView: View{
    
    @State private var txtEmail: String = ""
    @State private var txtPassword: String = ""
    @State private var isProgressViewHidden: Bool = true
    @State private var isErrorTextHidden: Bool = true
    @State private var txtErrorMsg: String = ""
    private let loginVM = LoginViewModel()
    @State private var moveToDashBoard : Bool = false
    @State private var showDashboard : Bool = false
    
    var body: some View {
        VStack{
            Text("Login...")
                .font(.largeTitle)
                .foregroundColor(Color.theme.greenColor)
            Spacer()
                .frame(height:20)
            TextField("Email Address", text: $txtEmail)
                .onChange(of: txtEmail, { oldValue, newValue in
                    if !Validator.isValidEmail(txtEmail) {
                        isErrorTextHidden = false
                        txtErrorMsg = "Email Address is invalid"
                    } else {
                        isErrorTextHidden = true
                        txtErrorMsg = ""
                    }
                })
                .frame(height:50)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.theme.greenColor, lineWidth: 2)
                )
                .accessibility(identifier: "login_page_txtEmail")
            Spacer()
                .frame(height:20)
            
            TextField("Password", text: $txtPassword)
                .frame(height:50)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.theme.greenColor, lineWidth: 2)
                )
                .onChange(of: txtPassword) { oldValue, newValue in
                    let checker = Validator.isValidPassword(newValue)
                    self.isErrorTextHidden = checker.status
                    self.txtErrorMsg = checker.message
                }
                .accessibility(identifier: "login_page_txtPassword")
            Spacer()
                .frame(height:20)
            if isProgressViewHidden == false {
                ProgressView()
            } else {
                EmptyView()
            }
            Spacer()
                .frame(height:10)
            if isErrorTextHidden == false {
                Text(txtErrorMsg)
                    .accessibility(identifier: "login_page_error_message")
            } else {
                EmptyView()
            }
            Spacer()
                .frame(height:10)
            Section {
                Button("Tap to Login") {
                    isProgressViewHidden = false
                    isErrorTextHidden = false
                    isProgressViewHidden = true
                    loginVM.loginApi("", "", completion: { responsse in
                        print("🔥",responsse)
                        showDashboard = true
                        UserSessionManagement.shared.userLoggedIn()
                    })
                }
                .frame(maxWidth: .infinity, maxHeight:50)
                .background(Color.theme.greenColor)
                .foregroundColor(.white)
                .cornerRadius(25)
                .font(.headline)
            }.disabled(txtEmail.isEmpty || txtPassword.isEmpty)
                .accessibility(identifier: "login_page_login_btn")
        }
        .navigationDestination(isPresented: $showDashboard) {
            DashboardScreen()
        }
        .navigationBarBackButtonHidden()
        .padding(.all)
        .frame(maxWidth: .infinity, maxHeight:.infinity)
    }
    
}


struct LoginView_PreviewProvider: PreviewProvider{
    
    static var previews : some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
