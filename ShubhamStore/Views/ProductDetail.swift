//
//  ProductDetail.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 24/02/25.
//
import SwiftUI

struct ProductDetail: View{
    
    let product : Product
    //   let coreDM : CoreDataManager
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @State private var isProductAddedToCart: Bool = false
    
    var body : some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 8)
                    ProductDetailImageView(imageURL: self.product.image!)
                    VStack(alignment: .leading) {
                        Text(product.title!)
                            .font(.headline)
                          .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                        Text("\(product.price!.asCurrencyWith6Decimal())")
                            .font(.headline)
                            .foregroundColor(Color.theme.greenColor)
                           .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                        Button("Add To Cart") {
                            print(
                                "user tapped on Add to cart"
                            )
                            self.cartVM.addToCart(product: self.product, quantity: 1)
                            self.isProductAddedToCart = true
                        }
                        .foregroundColor(Color.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(Color.theme.greenColor)
                        .cornerRadius(25)
                        if isProductAddedToCart == true {
                            Text("Product added to cart")
                                .font(.headline)
                                .foregroundColor(Color.theme.greenColor)
                        }
                       
                    }
                }
            }
        }
        .tint(.theme.greenColor )
        .navigationTitle(product.title ?? "Product Detail")
        .navigationViewStyle(.stack)
    }
}

/*
struct ProductDetail_PreviewProvider : PreviewProvider {
    static var previews : some View {
        ProductDetail(product: Product(id: 2, title: "Mens Casual Premium Slim Fit T-Shirts ", price: 999.0, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: Category(rawValue: "men's clothing"), image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.4, count: 4763)))
            .previewLayout(.sizeThatFits)
            .previewDevice("iPhone 14 Pro")
    }
}
*/

struct ProductDetailImageView: View {
    
    let imageURL : String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL))
        {
            phase in switch phase {
                // failed to load the image, show default photo icon
            case .failure: Image(systemName: "photo")
                    .font(.largeTitle)
                // successully loaded the image -> show image and make resizable
            case .success(let image): image
                    .resizable()
                    .scaledToFit()
                // no success or failure yet, still loading -> show ProgressView
            default: ProgressView()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 8,height: UIScreen.main.bounds.height/1.5)
        //.frame(width: .infinity, height: 300)
        .padding()
    }
}
