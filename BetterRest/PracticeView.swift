//
//  PracticeView.swift
//  BetterRest
//
//  Created by APPLE on 14/06/24.
//

import SwiftUI
struct PracticeView: View {
    @State private var selectDate = Date()
    
    
    var body: some View {
        
       DatePicker("Enter your date",selection: $selectDate)
        Text(Date(), format: .dateTime.hour().minute())
        
        Text(Date(), format: .dateTime.day().month().year())
        
        Text(Date().formatted(date: .long,time: .shortened))
        
        
    }
    func rangShow(){
//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range = now...tomorrow
        
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
       // let date = Calendar.current.date(from:components) ?? .now
        
//        let component = Calendar.current.dateComponents([.hour,.minute],from: .now)
       // let hours = component.hour ?? 0
        //let minutes = components.minute ?? 0
        
    }
}

#Preview {
    PracticeView()
}
