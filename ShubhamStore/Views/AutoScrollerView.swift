//
//  AutoScrollerView.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 21/02/25.
//

import SwiftUI

struct AutoScroller: View {
    var imageNames: [String]
    let timer = Timer.publish(every: 3.0,/*2.5,*/ on: .main, in: .common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        ZStack {
            //Below two lines add background color to crousel view
            //  Color.secondary
            //     .ignoresSafeArea()
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        // Image("\(imageNames[index])")
                        AsyncImage(url: URL(string: "\(imageNames[index])"))
                        { phase in switch phase {
                            // failed to load the image, show default photo icon
                        case .failure: Image(systemName: "photo")
                                .font(.largeTitle)
                            // successully loaded the image -> show image and make resizable
                        case .success(let image): image
                                .resizable()
                            // .scaledToFit()
                            // no success or failure yet, still loading -> show ProgressView
                        default: ProgressView()
                        } }
                        .tag(index)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 180)
                        .padding(8)
                    }
                    //  .background(.clear)
                    //     .background(VisualEffectBlur())
                    //                    .shadow(radius: 20)
                }
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.theme.greenColor.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 35, height: 8)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
                .offset(y: 70)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
            }
        }
    }
}


struct AutoScroller_PreviewProvider : PreviewProvider {
    static var previews: some View {
        AutoScroller(imageNames: ["https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  
                                  "https://images.unsplash.com/photo-1534723452862-4c874018d66d?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  "https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=3125&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  "https://images.unsplash.com/photo-1545601445-4d6a0a0565f0?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"])
        
        .previewLayout(.sizeThatFits)
    }
}

