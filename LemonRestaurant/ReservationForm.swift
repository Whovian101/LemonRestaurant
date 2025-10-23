//
//  ReservationForm.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/17/25.
// Difference between private var or just var mentions 1 is accessible outside the view while the other is internal (better)
// @State variables to store User input
// textfield allows user to enter their name
// Stepper provides the ability to select number of guests

import SwiftUI

// State variables
struct ReservationForm: View {
    @State private var userName: String = "" //user input required - name
    @State private var guestCount: Int = 0 //user input required - number of guests
    @State private var isPending: Bool = false // if user clicks confirm reservation, I want to display 'reservation is pending
    @State private var reservationDate: Date = Date()
    @State private var allergiesNotes: String = ""
    @State private var showSummary = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Reservation Details")) {
                        TextField("Enter your name", text: $userName)
                            .textFieldStyle(.roundedBorder)
                            .padding(2)
                            .font(.system(size:18,weight: .medium))
                        if userName == "" {
                            Text("Please enter your name")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        //made a rainbow with linearGradient :)
                        if guestCount > 8 {
                            Text("For parties larger than 8, we will call to confirm.")
                                .font(.title3)
                                .foregroundStyle(LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple],
                                                                startPoint: .leading,
                                                                endPoint: .trailing))
                        } else {
                            if guestCount >= 5 {
                            Text("For large parties, please arrive 10 minutes early")
                                    .foregroundColor(.blue)
                            }
                        }
                        Stepper("Guests: \(guestCount)", value: $guestCount, in: 1...10)
                            .padding(2)
                        
                        DatePicker("Date", selection: $reservationDate, in: Date()..., displayedComponents:[.date, .hourAndMinute])
                            .padding(2)
                        
                        if reservationDate < Date() {
                            Text("Please select a valid date")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Allergies (optional)", text: $allergiesNotes)
                            .textFieldStyle(.roundedBorder)
                            .padding(2)
                            .foregroundStyle(Color(.secondaryLabel))
                        
                        //added to show button select is working
                        if isPending {
                            Text("Reservation is pending...")
                                .font(.system(size:18,weight: .bold))
                                .foregroundColor(.blue)
                        } else {
                            
                            Button("Confirm Reservation") {
                                isPending = true
                                showSummary = true
                            }
                            .disabled(userName.isEmpty || guestCount == 0)
                            .navigationDestination(isPresented: $showSummary) {
                                ReservationSummaryView(
                                    name:$userName,
                                    guests:$guestCount,
                                    allergiesNotes:$allergiesNotes,
                                    reservationDate:    $reservationDate)
                            }
                            
                            
                            
                            //If preferred, can remove padding/background and change foreground to black
                            //Background of button to change to rainbow if group > 5 Party!
                            .padding()
                            .background(
                                Group {
                                    if guestCount > 5 { LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple],
                                                                       startPoint: .leading,
                                                                       endPoint: .trailing)
                                    } else {
                                        Color.gray
                                    }
                                }
                                
                            )
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                    
                }
            }
        }
    }
    }
    #Preview {
        ReservationForm()
    }
