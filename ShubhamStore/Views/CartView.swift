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
                    Image(systemName: "photo")
                            .font(.largeTitle)
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    VStack(alignment: .leading) {
                        Text(cartItem.title!)
                            .font(.headline)
                        Text((cartItem.price?.asCurrencyWith6Decimal())!)
                            .font(.subheadline)
                    }
                    Spacer()
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
                .listRowSeparatorTint(.theme.greenColor)
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
    }
}



struct CartView_PreviewProvider : PreviewProvider {
    
    static var previews : some View {
        CartView()
    }
}
