//
//  ContentView.swift
//  BetterRest
//
//  Created by APPLE on 18/04/24.
//
import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
   
    @State private var wakeUp = defaultWakeTime
   
    @State private var sleepAmount = 8.0
    @State private var cofeeIntake = 1
    @State private var ans = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = true
    
    var calculateBedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60 * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(cofeeIntake))
            let sleepTime = wakeUp - prediction.actualSleep
            
           
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
                
        }
        catch{
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        return alertMessage
    }
    
  
    var body: some View {
        NavigationStack{
            Form{
//                VStack(alignment: .leading,spacing: 0)
                Section("When do you wake up"){
//                    Text("when do you wake up")
//                        .font(.headline)
                    DatePicker("Please enter a time",selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                }
                
//                VStack(alignment: .leading,spacing: 0)
               Section("Amount of sleep do you want") {
//                    Text("amount of sleep do you want")
//                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in: 4...12,step: 0.25)
                }
                
//                VStack(alignment: .leading,spacing: 0)
                Section("Amount of Cofee Intake"){
//                    Text("amount of coffeIntake")
//                        .font(.headline)
//                    Stepper(cofeeIntake == 1 ? "1 cup" : "\(cofeeIntake) cup(s)",value: $cofeeIntake,in: 1...20)
//                    Stepper("^[\(cofeeIntake) cup](inflect: true)", value: $cofeeIntake, in: 1...20)
    Picker("Amount of cofeeIntake",selection:$cofeeIntake){
        ForEach(1...20,id: \.self){
            Text("\( $0 == 1 ? "\($0) Cup":"\($0) Cups")")
                        }
                    }
                    
            }
                Section("Your ideal bed time"){
                    Text(calculateBedtime)
                        .background(.red)
                }
            }
            .navigationTitle("BetterRest")
//            .toolbar{
//                Button("Calculate",action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//                    
//            }
            
        }
        
    }
    
    
    
}

#Preview {
    ContentView()
}
