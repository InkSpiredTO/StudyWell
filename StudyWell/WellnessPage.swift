//
//  WellnessPage.swift
//  StudyWell
//
//  Created by Hem Gai on 7/15/25.
//

import SwiftUI

struct WellnessPage: View {
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
            
            Text("💧 today's water intake")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            //selection of preferance of type like oz or liters or cups and then they click a number to add onto the number on the screen
            Button("Select amount") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
}

#Preview {
    WellnessPage()
}
