//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI

struct StudyCorner: View {
    
    var body: some View {
        
        let lightPink = Color(red: 1.0, green: 0.95, blue: 0.95)
        
        ZStack {
            lightPink.ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    HStack  {
                        
                        Text("📚 Study Corner")
                            .font(.system(size: 40))
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.horizontal)
                                        
                    
                    Text("Welcome to Study Corner!")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom, 1.0)
                        .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                    
                    Text("Select One:")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                    
                    NavigationLink(destination: QuickTimer()) {
                        Text("Quick Timer")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 80)
                            .padding(.vertical, 15)
                            .background(Color(hue: 0.333, saturation: 0.788, brightness: 0.665).opacity(0.2))
                            .foregroundColor(Color(hue: 0.321, saturation: 0.665, brightness: 0.665))
                            .cornerRadius(30)
                    }
                    
                    NavigationLink(destination: Notes()) {
                        Text("Notes")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 120)
                            .padding(.vertical, 15)
                            .background(Color(hue: 0.333, saturation: 0.788, brightness: 0.665).opacity(0.2))
                            .foregroundColor(Color(hue: 0.321, saturation: 0.665, brightness: 0.665))
                            .cornerRadius(30)
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: Resources()) {
                        Text("Resources")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 80)
                            .padding(.vertical, 15)
                            .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                            .background(Color(hue: 0.937, saturation: 0.136, brightness: 1.0))
                            .cornerRadius(30)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    StudyCorner()
}
