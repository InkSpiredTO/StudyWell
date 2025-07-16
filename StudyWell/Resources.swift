//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI


struct Resources: View {
    
    var body: some View {
        NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("Study Corner!")
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
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(30)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal)
                    
                    Divider()
                        .overlay(Color.black)
                    
                        
                        Text("Welcome to Study Corner Resources!")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    
                    Text("Select One:")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }

#Preview {
    StudyCorner()
}
