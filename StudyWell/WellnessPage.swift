//
//  WellnessPage.swift
//  StudyWell
//
//  Created by Hem Gai on 7/15/25.
//

import SwiftUI

struct WellnessPage: View {
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
                .padding()
            
            //selection of preferance of type like oz or liters or cups and then they click a number to add onto the number on the screen
            Button("Select amount") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Text("🛏️ today's sleep goal")
                .font(.title2)
                .padding()
            
            //hours and minutes dropdown
            Button("Select amount") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Text("💌 current mood")
                .font(.title2)
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
