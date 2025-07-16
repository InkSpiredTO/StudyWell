//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI


struct QuickTimer: View {
    @State private var timeset = 0
    @State private var timeRemaining = 100
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let step = 1
    let range = 1...120
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.8117647058823529, green: 0.8313725490196079, blue: 0.7725490196078432)
                    .ignoresSafeArea()
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
                                .background(Color(red: 0.9372549019607843, green: 0.7254901960784313, blue: 0.796078431372549))
                                .foregroundColor(Color.black)
                                .cornerRadius(30)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal)
                    
                    Divider()
                        .overlay(Color.black)
                    
                    HStack  {
                                            
                        Text("Welcome to Quick Timer")
                            .font(.system(size: 20))
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 0)
                    .padding(.trailing, 40.0)
                    .padding(.leading)
                    
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1 // decrement the time by 1 second
                                } else {
                                    timer.upstream.connect().cancel() // stop the timer
                                }
                            }
                    
                    Stepper (
                                value: $timeRemaining,
                                in: range,
                                step: step
                            ) {
                                Text("Time remaining:  \(timeRemaining) sec")
                            }
                            .padding(10)
                    
                    Button("Start Timer") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
