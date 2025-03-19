//
//  DashboardScreen.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 19/02/25.
//

import SwiftUI

struct DashboardScreen : View {
    
    @State private var isLogoutTapped : Bool = false
    @ObservedObject var productsVM = ProductsViewModel()
    @State private var navigateToDetailPage: Bool = false
    @State private var navigateToCartPage : Bool = false
    @State private var selectedProduct : Product = Product(id: 2, title: "Mens Casual Premium Slim Fit T-Shirts ", price: 999.0, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: Category(rawValue: "men's clothing"), image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.4, count: 4763))
    
    let rows = [
        GridItem(.flexible())
    ]
    
    //    init() {
    //        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
    //    }
    
    var body: some View {
        NavigationView{
            GeometryReader { g in
                ScrollView(.vertical){
                    AutoScroller(imageNames: Constants.crouselImageArr)
                        .frame(height: 200)
                    Spacer()
                        .frame(height: 20)
                    DashboardGridHeadingBar(heading: "Trending 🔥")
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(productsVM.products,id: \.id) { product in
                                ProductCellView(product: product)
                                    .onTapGesture{
                                        navigateToDetailPage = true
                                        self.selectedProduct = product
                                    }
                            }
                        }.padding(.horizontal)
                    }
                    Spacer()
                        .frame(height: 20)
                    DashboardGridHeadingBar(heading: "Today's Special 🤩")
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(productsVM.products.reversed(),id: \.id) { product in
                                ProductCellView(product: product)
                                    .onTapGesture{
                                        navigateToDetailPage = true
                                        self.selectedProduct = product
                                    }
                            }
                        }.padding(.horizontal)
                    }
                }
            }
            .onAppear(){
                productsVM.getProducts()
            }
            .toolbar{
                ToolbarItem{
                    Button { 
                        self.navigateToCartPage = true
                    } label: {
                        Image(systemName: "cart")
                            .tint(Color.theme.greenColor)
                    }
                }
                ToolbarItem{
                    Button {
                        self.isLogoutTapped = true
                        UserSessionManagement.shared.userLoggedOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .tint(Color.theme.greenColor)
                    }
                }
            }
            .navigationBarTitle("Bapu Store LLC")
            .navigationDestination(isPresented: $isLogoutTapped) {
                LoginView()
            }
            .navigationDestination(isPresented: $navigateToDetailPage) {
                ProductDetail(product: selectedProduct)
            }
            .navigationDestination(isPresented: $navigateToCartPage) {
                CartView()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationViewStyle(.stack)
    }
}


//struct DashboardScreen_PreviewProvider : PreviewProvider{
//    static var previews : some View {
//        Group {
//            DashboardScreen()
//                .previewDevice("iPhone 15")
//            //   .preferredColorScheme(.dark)
//        }
//    }
//}
