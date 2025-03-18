//
//  ProductCellView.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 22/02/25.
//

import SwiftUI

struct ProductCellView : View {
    
    let product : Product
    
    var body: some View { 
        ZStack {
            VStack{
                Spacer()
                    .frame(height: 8)
                AsyncImage(url: URL(string:product.image!))
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
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                VStack(alignment: .leading){
                    Text(product.title!)
                        .font(.headline)
                        .foregroundColor(Color.theme.blueColor)
                        .frame(width: 120, height: 60)
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    Text("\(product.price!.asCurrencyWith6Decimal())")
                        .font(.headline)
                        .foregroundColor(Color.theme.greenColor)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
               
                
                Spacer()
                    .frame(height: 8)
            } 
            
        }
        
    }
}


struct ProductCell_PreviewProvider : PreviewProvider {
    
    static var previews: some View {
        ProductCellView(product: Product(id: 2, title: "Mens Casual Premium Slim Fit T-Shirts ", price: 999.0, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: Category(rawValue: "men's clothing"), image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.4, count: 4763)))
            .previewLayout(.sizeThatFits)
    }
}
