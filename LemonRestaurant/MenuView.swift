//
//  MenuView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/23/25.
//
// I want to update to only show Thank you message after user views menu and de-selects menu
// Or show toggle to only show premium menu items or value items only - additional toggle: Full Menu, Premium Menu, or Value Menu



import SwiftUI

struct MenuView: View {
    //Variable secrtion
    @State private var showMenu: Bool = false
    @State private var showthankYou: Bool = false
    // creating the menu dictionary
    let menuItems = [
        "Pizza":6.99,
        "Pasta":5.50,
        "Salad":12.20,
        "Tacos":5.25,
        "Burger":6.50,
        "Sushi":19.99,
        "Pho":14.99,
        "Curry":18.99,
        "Prime Rib":25.99,
        "TomaHawk Steak":22.99,
        "Honey siracha BBQ wings":24.35,
        "Bonemarrow truffles fries":18.99
    ]
    
    
    var body: some View {
        VStack{ //vertical
            //Header Horizontal
            HStack{
                Image(systemName: "fork.knife")
                    .foregroundColor(.orange)
                    .font(.system(size:32))
                Text("Todays menu has \(menuItems.count) items")
                    .font(.title)
                    .bold()
            }
            
            //main
            VStack{
                Toggle("Show Menu", isOn: $showMenu)
                    .padding(.bottom)
                
                Toggle("Show Thank You Message", isOn: $showthankYou)
                
                
                if showthankYou{
                    Text("Thanks for visiting Little Lemon Restaurant!")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .italic()
                        .padding(.bottom)
                }
            }
            
            
            //Menu List
            if showMenu {
                List {
                    ForEach(menuItems.sorted(by: {$0.key > $1.key}), id: \.key) { (name,price) in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(name)
                                    .bold()
                                Text("$\(price,specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            //Premium Badge
                            
                            if price > 10 {
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("Premium")
                                }
                                .font(.caption)
                                .foregroundColor(.orange)
                                .padding()
                                .background(Color.orange.opacity(0.1))
                                .cornerRadius(8)
                            }
                            // another if value badge for items
                            
                            if price < 7 {
                                HStack{
                                    Image(systemName: "tag.fill")
                                    Text("Value")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                        .padding(6)
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(8)
                                    
                                }
                            }
                            
                        }
                    }
                    
                }
            }// the end of the List
        }
    }
}
    
#Preview {
    MenuView()
    }

