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
                        
                        Spacer()
                        
                        Text("Welcome to Study Corner!")
                            .font(.system(size: 20))
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 0)
                    .padding(.trailing, 80.0)
                    .padding(.leading)
                    
                    Text("Select One:")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .font(.system(size: 20))
                    
                    NavigationLink(destination: QuickTimer()) {
                        Text("Quick Timer")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 20)
                            .background(Color(red: 0.9372549019607843, green: 0.7254901960784313, blue: 0.796078431372549))
                            .foregroundColor(Color.black)
                            .cornerRadius(30)
                    }
                    
                    Button {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    } label: {
                        Text("Pomodoro")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20.0)
                            .background(Color(red: 0.9372549019607843, green: 0.7254901960784313, blue: 0.796078431372549))
                            .foregroundColor(Color.black)
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
