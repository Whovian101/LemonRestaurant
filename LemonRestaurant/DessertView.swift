//
//  DessertView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/25/25.
//

import SwiftUI

struct DessertView: View {
    @State private var selectedDessert: Bool = false
    
    let dessertItems = [
        "Cake":6.99,
        "Donut":5.50,
        "Ice Cream":12.20,
        "Eclairs":5.25,
        "Candy Bar":6.50
    ]
    
    var body: some View {
        List{
            ForEach(dessertItems.sorted(by: { $0.key < $1.key }), id: \.key){
                (name,price) in
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .bold()
                        Text("$\(price,specifier: "%.2f")")
                            .foregroundColor(.secondary)
                        
                        if price > 10 {
                            HStack{
                                Image(systemName: "star.fill")
                                Text("Premium")
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    DessertView()
}

