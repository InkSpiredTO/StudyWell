//
//  StudyCorner.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI


struct Resources: View {
    
    var body: some View {
        let lightPink = Color(red: 1.0, green: 0.95, blue: 0.95)
        
        ZStack {
            lightPink.ignoresSafeArea()
            
        NavigationStack {
            
                HStack  {
                    
                    Text("📖 Resources")
                        .font(.system(size: 40))
                    
                    Spacer()
                    
                }
                .padding(.top)
                .padding(.bottom, 10.0)
                .padding(.horizontal)
                
                ScrollView {
                    
                    VStack {
                        
                        
                        Text("Welcome to Study Corner Resources!")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                            .foregroundColor(Color(hue: 0.908, saturation: 0.675, brightness: 0.899))
                        
                        GroupBox(label: Text("Kahoot").bold().font(.system(size: 25))) {
                            
                            Link(destination: URL(string: "https://kahoot.com/?utm_name=controller_app")!) {
                                Image("kahoot")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .padding(20)
                            }
                            .background(Color(hue: 0.333, saturation: 0.788, brightness: 0.665).opacity(0.2))
                            
                            
                            DisclosureGroup {
                                Text("Using various methods like flashcards, Kahoot is a site that provides a gamified experience when studing.")
                                    .padding(.all)
                            } label: {
                                Text("About")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                                
                                
                            }
                            .padding(.horizontal, 20)
                            
                        }
                        .padding(.vertical)
                        
                        GroupBox(label: Text("Khan Academy").bold().font(.system(size: 25))) {
                            
                            Link(destination: URL(string: "https://www.khanacademy.org/")!) {
                                Image("KhanAcademy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .padding(20)
                            }
                            .background(Color(hue: 0.333, saturation: 0.788, brightness: 0.665).opacity(0.2))
                            
                            DisclosureGroup {
                                Text("Khan Academy is an educational site where: 'Students practice at their own pace' and 'accelerate their learning'. Kahn Academy provides courses from math, to science, to english, and so much more.")
                                    .padding(.all)

                            } label: {
                                Text("About")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                                
                                
                            }
                            .padding(.horizontal, 20)
                            
                        }
                        .padding(.vertical)

                        
                        GroupBox(label: Text("Wolfram Alpha").bold().font(.system(size: 25))) {
                            
                            Link(destination: URL(string: "https://kahoot.com/?utm_name=controller_app")!) {
                                Image("Wolfram")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .padding(20)
                            }
                            .background(Color(hue: 0.333, saturation: 0.788, brightness: 0.665).opacity(0.2))
                            
                            DisclosureGroup {
                                Text("Acording to the website Wolfram is: 'A unique engine for computing answers and providing knowledge. It works by using its vast store of expert-level knowledge and algorithms to automatically answer questions, do analysis and generate reports'")
                                    .padding(.all)
                            } label: {
                                Text("About")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                                
                                
                            }
                            .padding(.horizontal, 20)
                            
                        }
                        .padding(.vertical)
                        
                        
                        
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    
                }
                
            }
            
        }
    }
}
        

#Preview {
    StudyCorner()
}
