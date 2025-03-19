//
//  HStack.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 19/03/25.
//

import SwiftUI

struct DashboardGridHeadingBar : View {
    let heading : String
    var body : some View {
        HStack(alignment: .top){
                Text(heading)
                    .font(.headline)
                    .foregroundColor(Color.theme.greenColor)
                Spacer()
                Button("View All") {
                    print("View All tapped")
                } .font(.headline)
                    .foregroundColor(Color.theme.greenColor)
            }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
}


