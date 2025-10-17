//
//  ContentView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "sun.max")
                    .imageScale(.large)
                    .foregroundStyle(.yellow)
                Text("Hello, world!")
                NavigationLink(destination:AboutView()){
                    Text("About")
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
