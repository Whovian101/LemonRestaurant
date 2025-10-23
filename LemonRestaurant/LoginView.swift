//
//  LoginView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/18/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var userName:String
    @Binding var isLogged:Bool
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Login")
                    .font(.largeTitle)
                    .padding(.top, 40)
                
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(20)
                
                TextField("Enter your name:", text:$userName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Login"){
                    if !userName.isEmpty{
                        isLogged = true
                    }
                       
                    }
                .disabled(userName.isEmpty)
                .padding()
                .foregroundColor(.blue)
                
                Spacer()
                
                }
                }
            }
        }
