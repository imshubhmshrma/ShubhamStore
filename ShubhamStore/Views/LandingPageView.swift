//
//  LandingPage.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 17/02/25.
//

import SwiftUI

struct LandingPageView: View {
    
    @State private var path: [Route] = []
    @State private var isUserLoggedIn : Bool = false
    
    var body: some View {
        
        NavigationStack(path: $path){
            VStack {
                Text("Welcome to Shubham Store LLC.")
                    .font(.largeTitle)
                    .foregroundStyle(Color.theme.greenColor)
                    .accessibility(identifier: "landing_page_welcome_text")
                Spacer()
                    .frame(height:20)
                ProgressView()
            }
            .navigationDestination(for: Route.self) { route in
                switch(route){
                case .loginScreen:
                    LoginView()
                case .dashboardScreen:
                    DashboardScreen()
                }
            }
        }
        .onAppear{
            self.isUserLoggedIn = UserSessionManagement.shared.userLoginInStatus()
            
            if self.isUserLoggedIn {
                DispatchQueue.main.asyncAfter(deadline : .now() + 1) {
                    path.append(.dashboardScreen)
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline : .now() + 1) {
                    path.append(.loginScreen)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.white)
        
    }
}

#Preview {
    LandingPageView()
}
