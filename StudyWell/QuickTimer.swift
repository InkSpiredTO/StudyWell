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
        let lightPink = Color(red: 1.0, green: 0.95, blue: 0.95)
        
        ZStack {
            lightPink.ignoresSafeArea()
            NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("⏲️ Quick Timer")
                            .font(.system(size: 40))
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal)
                    

                    
                    Text("Welcome to Study Corner Quick Timer!")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                    
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
                            .foregroundColor(Color(hue: 0.321, saturation: 0.665, brightness: 0.665))
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
                            .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                            .background(Color(hue: 0.937, saturation: 0.136, brightness: 1.0))
                            .cornerRadius(30)
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    StudyCorner()
}
