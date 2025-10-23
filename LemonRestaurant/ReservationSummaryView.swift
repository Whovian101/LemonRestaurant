//
//  ReservationSummaryView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/21/25.
//

import SwiftUI

struct ReservationSummaryView: View {
    @Binding var name:String
    @Binding var guests:Int
    @Binding var allergiesNotes:String
    @Binding var reservationDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Reservation Completed!")
                .font(.title)
                .foregroundColor(.green)
            
            
            //adding information
            Text("Thank you, \(name), your reservation is confirmed for \(guests) people.")
            Text("Date: \(reservationDate.formatted(date: .long,time: .shortened))")
            Text("Guests: \(guests)")
            
            // show allergy notes only if not empty
            if !allergiesNotes.isEmpty {
                Text("Note: We will accommodate the following allergies: \(allergiesNotes)")
            }
            
        }
    }
    }
//
//#Preview {
 //   ReservationSummaryView()
//}


