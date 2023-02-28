//
//  ContentView.swift
//  Revitalize_0_1_2
//
//  Created by Andrea Reed on 2/21/23.
//

import SwiftUI
import AuthenticationServices

struct EditGauge{
	var isgaugePresented = false
	var progress: Double = 0
	mutating func present(initialProgress: Double){
		progress = initialProgress
		isgaugePresented = true
	}
}

struct ContentView: View {
	
	@EnvironmentObject private var gv: DeclarationsViewModel
	
	@State private var editGauge = EditGauge()
	func presentGauge() {
		gv.gaugeValue = gv.fundsRaised / gv.goal * 100}
	
	//MARK: need to bind gauge value
	//	@Binding var editGauge: EditGauge
	
	
	
	var body: some View {
		
		
		NavigationView {
			ScrollView  {
				
				ZStack{
					VStack{
						HStack{
							Image("Revitalize")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:200, height: 75)
							
							VStack{
								
								
								NavigationLink(destination: LoginView()) {
									Image("Login")
										.resizable()
										.aspectRatio(contentMode: .fit )
										.frame(width:75, height: 25)
								}
							}
							
						}.padding(.bottom, 20)
						HStack(){
							
							NavigationLink(destination: Donate()) {
								//
								Image("Donate")
								
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:80, height: 30, alignment: .leading)
								//						.offset(x: -215.0, y: 0.0)
								
							}.padding(.trailing, 40.0)
							
							VStack{
								
								let gaugeValue = gv.fundsRaised / gv.goal * 100
								
								Gauge(value: gaugeValue, in: 0...100) {
									
									
									
									
									Text("Goal $\(Int(gv.goal))")
										.bold()
										.foregroundColor(gaugeValue == 100 ? .green : .init("primaryGreen"))
								} currentValueLabel: {
									
									Text("$\(Int(gv.fundsRaised))")
										.foregroundColor(gaugeValue ==  100 ? .green : .init("primaryGreen"))
								} minimumValueLabel: {
									Text("0%")
									
									
								} maximumValueLabel: {
									Text("100%")
								}.gaugeStyle(.automatic)
									.tint(gaugeValue == 100 ? .green : .init("primaryGreen"))
								
							}.frame(width:150, height:75)
							//						.offset(x: -150.0, y: 0.0)
							
						}
						
						HStack{
							Image("CurrentProjectCard")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:300, height: 400)
						}
						
						NavigationLink (destination: Gallery()) {
							Image("SeeAll")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:80, height: 30, alignment: .leading)
							
						}
						.offset(x: 80.0, y: -40.0)
						VStack{
							Text("Current Homeowner Project")
								.foregroundColor(.init("primaryGreen"))
							Text("CREATED 12/23/2022")
								.foregroundColor(.init("primaryGreen"))
							Text("BIO")
								.foregroundColor(.init("primaryGreen"))
							Text("Hi we’re the Fordson’s and we have a 1919 colonial we are fixing. We have already gutted and removed debris and need a little help funding the roof and exterior paint.")
								.foregroundColor(.init("primaryGreen"))
							
								.frame(width:300)
								.padding()
							
						}
						
						HStack{
							NavigationLink(destination: HomeOwnersGuide()){
								Image("HomeOwnersGuideCard")
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:400, height: 130)
									.offset(x: 0.0, y: 0.0)
							}
							
							
						}
						
							
						}
					
						
					}
				Spacer()
//				HStack {
//
//
//					Image(systemName: "text.below.photo.fill")
//						.foregroundColor(Color.gray)
//
//							Text("GALLERY")
//
//
//					Image(systemName: "person.crop.circle.fill")
//						.foregroundColor(Color.gray)
//							Text("PROFILE")
//
//				}
//
//				.frame(maxWidth: .infinity)
//				.frame(height: 50)
//				.padding(.top, 50.0)
//				.background(Color(hue: 0.668, saturation: 0.019, brightness: 0.82, opacity: 0.243))
				
				
				
				
				}
			}
		}
	}
	
	
	
	
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			
			ContentView() .environmentObject(DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 1800.0, gaugeValue: 0.0))
			
		}
	}

