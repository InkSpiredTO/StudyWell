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
        NavigationStack {
            VStack {
                HStack  {
                    
                    Text("Study Corner")
                        .font(.system(size: 40))
                    
                    Spacer()
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
                
                TextField("Type title here", text: $NoteTitle)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    .padding(20)
                
                TextEditor(text: $Notes)
                    .padding(30)
                    .font(.title)
                    .background(Color.gray.opacity(0.2))

                }
                
            }
            
        }
    }

#Preview {
    Notes()
}
