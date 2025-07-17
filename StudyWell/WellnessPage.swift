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

    @State private var moodLog: [(time: Date, mood: String)] = []
    @State private var selectedMoodTime = Date()
    @State private var selectedMood = "🙂"
    @State private var showMoodPicker = false
    let moodOptions = ["😊", "🙂", "😐", "😢", "😡"]
    
    var body: some View {
        VStack {
            VStack(){
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
                        .cornerRadius(30)
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
                .cornerRadius(30)
                
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
                            showMoodPicker.toggle()
                        }
                        .padding()

                        if showMoodPicker {
                            VStack(spacing: 20) {
                                DatePicker("Select Time", selection: $selectedMoodTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()

                                Picker("Select Mood", selection: $selectedMood) {
                                    ForEach(moodOptions, id: \.self) { mood in
                                        Text(mood)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())

                                Button("Save Mood") {
                                    moodLog.append((time: selectedMoodTime, mood: selectedMood))
                                    selectedMoodTime = Date()
                                    selectedMood = "🙂"
                                    showMoodPicker = false
                                }
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(10)
                            }
                            .padding()
                        }

                        // 🆕 Mood log display
                        if !moodLog.isEmpty {
                            VStack(alignment: .leading) {
                                Text("📜 Mood Log")
                                    .font(.headline)
                                    .padding(.top)
                                ForEach(moodLog.indices, id: \.self) { index in
                                    let entry = moodLog[index]
                                    Text("\(entry.time.formatted(date: .omitted, time: .shortened)) - \(entry.mood)")
                                }
                            }
                            .padding()
                        }

                        Spacer()
                    }
                    .background(Color(red: 0.8117647059, green: 0.831372549, blue: 0.7725490196))
                }
            }

            #Preview {
                WellnessPage()
            }
