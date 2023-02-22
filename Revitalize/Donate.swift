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
    @EnvironmentObject var donations: Donations
    
    var body: some View {
        VStack{
			Text("The Fordson's sincerely appreciate you!")
				.font(.title2)
                .foregroundColor(.init("primaryGreen"))
                .fontWeight(.black)
                .frame(width: 200)
                .multilineTextAlignment(.center)
				.padding(.bottom, 10.0)
            
            Image("Fordsons")
                .resizable()
                    .aspectRatio(contentMode: .fit )
					.frame(width:125.0, height: 125.0)
//make button on click change view to toggled image
            Image("PayFrequency")
                .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width:200)
                    
            Text("CHOOSE AMOUNT")
                .foregroundColor(.init("primaryGreen"))
			Grid(){
				GridRow(){
					Button(){
						donations.donatedAmount = 25.0
					} label: {
						Image("Pay25")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
					
					Button(){
						donations.donatedAmount = 50.0
					} label: {
						Image("Pay50")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
				}
				
				GridRow(){
					Button(){
						donations.donatedAmount = 100.0
					} label: {
						Image("Pay100")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
					Button(){
						donations.donatedAmount = 200.0
					} label: {
						Image("Pay200")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100.0)
					}
					
				}
				
				
				Text("Leave a message for the Fordson's")
					.italic()
					.foregroundColor(.init("primaryGreen"))
				TextField("Message", text: $messageToHomeOwner)
					.padding(.bottom, 30.0)
					.offset(x: 15.0, y: -30.0)
					.frame(width: 250, height: 120.0)
					.border(Color(hue: 0.646, saturation: 0.052, brightness: 0.854), width: 1)
				
				
		
				Spacer()
				
				ZStack{
					
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
								}
								
							}
						
					}
				}
				Spacer()
				
				
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
