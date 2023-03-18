//
//  Donate.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import SwiftUI

struct Donate: View {
	
	@ObservedObject var gv: DeclarationsViewModel
	@State private var switchToggle = false
	@State private var donorSignature: String = ""
	@State private var showingAlert = false
	
	
	var body: some View {
		VStack{
			Text("The Fordson's sincerely appreciate you!")
				.font(.title2)
				.foregroundColor(.init("ForestGreen"))
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
				.foregroundColor(.init("ForestGreen"))
			Grid(){
				GridRow(){
					Button(){
						gv.donatedAmount = 25.0
					} label: {
						Image("Pay25")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
					
					Button(){
						gv.donatedAmount = 50.0
					} label: {
						Image("Pay50")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
				}
				
				GridRow(){
					Button(){
						gv.donatedAmount = 100.0
					} label: {
						Image("Pay100")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100)
					}
					
					Button(){
						gv.donatedAmount = 200.0
					} label: {
						Image("Pay200")
							.resizable()
							.aspectRatio(contentMode: .fit )
							.frame(width:100.0)
					}
					
				}
				
				
				
				
				
		
				Spacer()
				
				ZStack{
					
					Button(){
					

							gv.fundsRaised += gv.donatedAmount
						
							}
					
				label: {
						RoundedRectangle(cornerRadius: 20)
							.frame(width: 150,height: 50)
							.foregroundColor(.init("ForestGreen"))
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
			
				
			}
		}
	}
}

struct Donate_Previews: PreviewProvider {
	static var previews: some View {
		Donate(gv: DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 0.0, gaugeValue: 1800, initGoal: 0))
	}
}
