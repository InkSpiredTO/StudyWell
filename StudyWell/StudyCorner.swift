//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI


struct StudyCorner: View {
    
    var body: some View {
        NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("Study Corner")
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
                    

                        Text("Welcome to Study Corner!")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    
                    Text("Select One:")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    NavigationLink(destination: QuickTimer()) {
                        Text("Quick Timer")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 80)
                            .padding(.vertical, 15)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(Color.blue)
                            .cornerRadius(30)
                    }
                    
                    NavigationLink(destination: Pomodoro()) {
                        Text("Pomodoro")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 90)
                            .padding(.vertical, 15)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(Color.blue)
                            .cornerRadius(30)
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: Resources()) {
                        Text("Resources")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 80)
                            .padding(.vertical, 15)
                            .background(Color.purple.opacity(0.2))
                            .foregroundColor(Color.purple)
                            .cornerRadius(30)
                    }
                    
                }
                
            }
            
        }
        
    }

#Preview {
    StudyCorner()
}
