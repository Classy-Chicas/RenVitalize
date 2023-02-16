//
//  Donate.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/16/23.
//

import SwiftUI

struct Donate: View {
    @State private var messageToHomeOwner: String = ""
    @State private var switchToggle = false
    @State private var donorSignature: String = ""
    var body: some View {
        VStack{
            Text("The Fordson's sincerely appreciate you!")
                .foregroundColor(.init("primaryGreen"))
                .fontWeight(.black)
                .frame(width: 200)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Image("Fordsons")
                .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width:100, height: 100)

            Image("PayFrequency")
                .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width:200)
                    
            Text("CHOOSE AMOUNT")
                .foregroundColor(.init("primaryGreen"))
            Grid(){
                GridRow(){
                Image("Pay25")
                        .resizable()
                            .aspectRatio(contentMode: .fit )
                            .frame(width:100)
                            
                Image("Pay50")
                        .resizable()
                            .aspectRatio(contentMode: .fit )
                            .frame(width:100)
                            
                }
                
                GridRow(){
                Image("Pay100")
                        .resizable()
                            .aspectRatio(contentMode: .fit )
                            .frame(width:100)
                            
                Image("Pay200")
                        .resizable()
                            .aspectRatio(contentMode: .fit )
                            .frame(width:100)
                            
                }
                Text("Leave a message for the Fordson's")
                    .foregroundColor(.init("primaryGreen"))
                TextField("Message", text: $messageToHomeOwner)
                    .frame(width: 250, height: 150)
                    
                Toggle("Signature", isOn: $switchToggle)
                    .toggleStyle(SwitchToggleStyle(tint: .init("primaryGreen")))
                    .padding(.horizontal)
                    
                TextField("Sign", text: $donorSignature)
                    .padding(.horizontal)
                    .frame(height: 50)
                    
                Button(){
                    
                                          
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 150,height: 50)
                                            .foregroundColor(.init("primaryGreen"))
                                            .overlay {
                                                VStack {
                                                    Text("DONATE")
                                                        .foregroundColor(.white)
                                                        .fontWeight(.black)
                                                }}
                    
                }
//
                
            }
        }
    }
}

struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate()
    }
}
