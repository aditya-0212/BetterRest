//
//  SwiftUIView.swift
//  BetterRest
//
//  Created by APPLE on 19/04/24.
//
import SwiftUI

struct SwiftUIView: View {
    @State private  var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    func exampleDates(){
//        let tomorrow = Date.now.addingTimeInterval(86400)
//
//        let range = Date.now...tomorrow
//
//        let now = Date.now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = now...tomorrow
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components)
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
    }
    var body: some View {
        VStack{
            Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount, in: 4...12, step: 0.25)
            
            DatePicker("Please enter a date",selection: $wakeUp)
                .labelsHidden()
            
            DatePicker("Please enter a date",selection: $wakeUp,displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            DatePicker("Please enter a date",selection: $wakeUp,displayedComponents: .date)
                .labelsHidden()
            
            
            DatePicker("Select Date",selection: $wakeUp, in: Date.now...)
                .labelsHidden()
            
            Text(Date.now, format: .dateTime.hour().minute())
            
            Text(Date.now, format: .dateTime.day().month().year())
            
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        
    }
}

#Preview {
    SwiftUIView()
}




