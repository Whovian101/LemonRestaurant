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
    @State private var showPremium: Bool = false
    @State private var showDessert: Bool = false
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
    
    // Computed properties/variables
    // they do not store a alue
    // each access recomputes the value
    
    /*
     var propertyName: Type{
     return the calculated value
     }
     */
//    var sortedMenu: [(name: String,price:Double)]{
//        menuItems.sorted{ $0.value < $1.value } // key alpha - value price
//            .map{(key, value) in (name: key, price: value)}
//    }
        
        var filteredMenu: [(name: String,price:Double)]{
            menuItems.filter{ !showPremium || $0.value >= 10 }
                .map{(key,value) in (name: key, price: value)}
        }
    var shouldShowMenu: Bool{
        showMenu || showPremium
    }
    
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
            
            //main view
            VStack{
                Toggle("Show Menu", isOn: $showMenu)
                    .padding(.bottom)
                
                Toggle("Premium", isOn: $showPremium)

                Button("View Desserts"){
                    showDessert.toggle()
                }
                        .sheet(isPresented: $showDessert){
                            DessertView()
                        }
                }
            
            
            //Menu List
            if shouldShowMenu {
                if showPremium {
                    Text("Showing Premium Items Only")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                    
                }
                List {
                    ForEach(filteredMenu.sorted(by: { $0.name < $1.name }), id: \.name) { item in                        HStack {                            VStack(alignment: .leading) {                                Text(item.name)                                    .bold();                                Text("$\(item.price, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                           
                        Spacer();                            if item.price >= 10 {                                Label("Premium", systemImage: "star.fill")                                    .font(.caption)                                    .foregroundColor(.orange)                                    .padding(6)                                    .background(Color.orange.opacity(0.1))                                    .cornerRadius(8)                            };                            if item.price < 7 {                                Label("Value", systemImage: "tag.fill")                                    .font(.caption)                                    .foregroundColor(.green)                                    .padding(6)                                    .background(Color.green.opacity(0.1))                                    .cornerRadius(8)                            }                        }                    }                }            }        }        .padding()    }};#Preview {    MenuView()}
