//
//  ReservationSummaryView.swift
//  LemonRestaurant
//
//  Created by Linda Luna on 10/21/25.
//

import SwiftUI

struct ReservationSummaryView: View {
    private var name:String
    private var guests:Int
    private var allergiesNotes:String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Reservation Summary").font(.title)
            
            //adding information
            Text("Name: \(name)")
            Text("Number of Guests: \(guests)")
            Text("Allergy Notes: \(allergiesNotes)")
            
        }
    }
    }
//
//#Preview {
 //   ReservationSummaryView()
//}
