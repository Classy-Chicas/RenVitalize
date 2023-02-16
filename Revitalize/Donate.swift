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
            Image("Fordsons")
            Image("PayFrequency")
            Text("CHOOSE AMOUNT")
            Grid(){
                GridRow(){
                Image("Pay25")
                Image("Pay50")
                }
                GridRow(){
                Image("Pay100")
                Image("Pay200")
                }
                Text("Leave a message for the Fordson's")
                TextField("Message", text: $messageToHomeOwner)
                Toggle("Signature", isOn: $switchToggle)
                    .toggleStyle(.switch)
                TextField("Sign", text: $donorSignature)
                Button(){
                    
                } label: {
                    Text("Donate")
                }
                
            }
        }
    }
}

struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate()
    }
}
