//
//  Notes.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-17.
//

import SwiftUI
import SwiftData



struct Notes: View {
    @State private var Notes = ""
    @State private var NoteTitle = ""
    var body: some View {
        
        let lightPink = Color(red: 1.0, green: 0.95, blue: 0.95)
        
        ZStack {
            lightPink.ignoresSafeArea()
            NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("🗒️ Notes")
                            .font(.system(size: 40))
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal)
                    
                    
                    
                    Text("Welcome to Study Corner!")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                    
                    
                    
                    TextField("Type title here", text: $NoteTitle)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .padding(20)
                    
                    Divider()
                        .overlay(Color.black)
                    
                    Text("Type note here:")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                    
                    TextEditor(text: $Notes)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 1)
                        .font(.title)
                }
                
            }
            
        }
    }
}

#Preview {
    Notes()
}
