//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI

struct QuickTimer: View {
    @State private var buttonText = "Start Timer"
    @State private var timeset = 0
    @State private var timeRemaining = 0
    @State private var TimerOn = 0
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let step = 1
    let range = 1...120
    
    var body: some View {
        NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("Study Well!")
                            .font(.system(size: 40))
                        
                        Spacer()
                        
                        Button {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        } label: {
                            Text("+")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10)
                                .background(Color.blue.opacity(0.2))
                                .foregroundColor(Color.blue)
                                .cornerRadius(30)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal)
                    
                    Divider()
                        .overlay(Color.black)
                                            
                        Text("Welcome to Study Corner Quick Timer!")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            
                            .padding(.vertical)
                            .onReceive(timer) { _ in
                            print("Signal Recived")
                            if timeRemaining > 0 {
                                if TimerOn == 1 {
                                    timeRemaining -= 1 // decrement the time by 1 second
                                }
                            } else {
                                timer.upstream.connect().cancel() // stop the timer
                                TimerOn = 0
                                buttonText = "Start Timer"
                            }
                        }
                    
                    Stepper (
                                value: $timeRemaining,
                                in: range,
                                step: step
                            ) {
                                Text("Time remaining:  \(timeRemaining) sec")
                            }
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                    
                    Button {
                        if TimerOn == 0 {
                            buttonText = "Stop"
                            TimerOn = 1
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        } else if TimerOn == 1 {
                            buttonText = "Start Timer"
                            TimerOn = 0
                            timer.upstream.connect().cancel()
                        }
                    } label: {
                        Text(buttonText)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 90)
                            .padding(.vertical, 15)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(Color.blue)
                            .cornerRadius(30)
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }

#Preview {
    StudyCorner()
}
