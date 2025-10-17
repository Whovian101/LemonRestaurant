//
//  AboutView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/16/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Text("Welcome to the Lemon Restaurant")
            .font(.title)
            .padding()
        Image("littleLemonLogo")
            .resizable()
            .scaledToFit()
            .frame(height:80)
        
    }
}

#Preview {
    AboutView()
}
