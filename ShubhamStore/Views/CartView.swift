//
//  CartView.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/03/25.
//

import SwiftUI

struct CartView : View {
    
    @ObservedObject var cartVM : CartViewModel = CartViewModel()
    
    var body : some View {
        List{
            ForEach(cartVM.productArr, id : \.self) { cartItem in
                
                HStack{
                    ProductDetailImageView(imageURL: cartItem.image!)
                        .frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text(cartItem.title!)
                        Text((cartItem.price?.asCurrencyWith6Decimal())!)
                    }
                    VStack(alignment: .trailing) {
                        Button(action: {
                            self.cartVM.deleteCartItem(product: cartItem)
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .tint(Color.red)
                        })
                    }
                }
            }
        }
        .navigationTitle("Cart")
        .toolbar {
            ToolbarItem{
                Button {
                    self.cartVM.emptyCart()
                } label: {
                    Image(systemName: "trash.fill")
                        .tint(Color.theme.greenColor)
                }
            }
        }
        .onAppear{
            // print(cartVM.productArr.count)
        }
    }
}



//struct CartView_PreviewProvider : PreviewProvider {
//    
//    static var previews : some View {
//        CartView()
//    }
//}
