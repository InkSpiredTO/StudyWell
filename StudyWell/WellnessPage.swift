//
//  WellnessPage.swift
//  StudyWell
//
//  Created by Hem Gai on 7/15/25.
//

import SwiftUI

struct WellnessPage: View {
    @State private var totalWaterIntake = 0
    @State private var waterHistory: [Int] = []

    @State private var showTimePicker = false
    @State private var sleepStartTime = Date()
    @State private var sleepEndTime = Calendar.current.date(byAdding: .hour, value: 8, to: Date()) ?? Date()
       
    var body: some View {
        VStack{
            HStack {
                Text("Wellness")
                    .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding()
                Spacer()
                }
            
            //selection of preferance of type like oz or liters or cups and then they click a number to add onto the number on the screen

            Text("💧 today's water intake")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text("\(totalWaterIntake) oz")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .frame(width: 135, height: 60)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)
            HStack(spacing: 20) {
                ForEach([8, 16, 24], id: \.self) { amount in
                    Button("+\(amount)") {
                        totalWaterIntake += amount
                        waterHistory.append(amount)

                    }
                    .padding()
                    .frame(width: 70)
                    .frame(height: 45)
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                }
            }
                       
            Button("Undo Last") {
                if let last = waterHistory.popLast() {
                    totalWaterIntake -= last
                }
            }
            .padding()
            .foregroundColor(.red)
            .frame(height: 40)
            .background(Color.red.opacity(0.1))
            .cornerRadius(8)

            }
            Text("🛏️ today's sleep goal")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(nil)
                .padding()
            
            //hours and minutes dropdown
            Button("Select sleep time range") {
                            showTimePicker.toggle()
                        }
                        
                        if showTimePicker {
                            VStack(spacing: 20) {
                                DatePicker("Sleep Start", selection: $sleepStartTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                
                                DatePicker("Sleep End", selection: $sleepEndTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                Text("Sleep Time: \(sleepStartTime.formatted(date: .omitted, time: .shortened)) - \(sleepEndTime.formatted(date: .omitted, time: .shortened))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
            Text("💌 current mood")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            //choose a time of day and select the mood from a dropdown of emoji options
            Button("Log in mood") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
Spacer()
        }
    }


#Preview {
    WellnessPage()
}
