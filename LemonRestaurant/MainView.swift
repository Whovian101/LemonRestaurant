//
//  MainView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/18/25.
//

import SwiftUI

struct MainView: View {
    @State private var uName = ""
    @State private var isLoggedIn = false
    var body: some View {
        NavigationView{
                if isLoggedIn == true{
                    VStack{
                        Text("Welcome \(uName)")
                        .font(.title)
                        .bold()
                        NavigationLink("Make a reservtion", destination:ReservationForm())
                        NavigationLink("About us",destination:AboutView())
                        
                        Button("Logout"){
                            isLoggedIn = false
                        }
                    }
                }else{
                    LoginView(userName:$uName,isLogged:$isLoggedIn)
            }
        }
    }
}

#Preview {
    MainView()
}
