//
//  ContentView.swift
//  Revitalize_0_1_2
//
//  Created by Andrea Reed on 2/21/23.
//

import SwiftUI


struct ContentView: View {
	
	@EnvironmentObject private var gv: DeclarationsViewModel
	
	
	
	
    var body: some View {
		
		NavigationView {
			ScrollView{
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
//					Spacer(minLength: 20)
					Image("Donate")
					
						.resizable()
						.aspectRatio(contentMode: .fit )
						.frame(width:80, height: 30, alignment: .leading)
//						.offset(x: -215.0, y: 0.0)
				}
				
			VStack{
				
				
				Gauge(value: gv.gaugeValue, in: 0...100) {

					
					Text("Goal \(Int(gv.goal))")
													.bold()
													.foregroundColor(gv.gaugeValue == 100 ? .green : .init("primaryGreen"))
											} currentValueLabel: {
												
												Text("$\(Int(gv.fundsRaised))")
													.foregroundColor(gv.fundsRaised / gv.goal * 100  ==  100 ? .green : .init("primaryGreen"))
											} minimumValueLabel: {
												Text("0%")
								
					
											} maximumValueLabel: {
												Text("100%")
											}.gaugeStyle(.automatic)
					.tint(gv.goal - gv.fundsRaised == 100 ? .green : .init("primaryGreen"))
										
					}.frame(width:150, height:75)
//						.offset(x: -150.0, y: 0.0)
										
													}
						
						HStack{
							Image("CurrentProjectCard")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:300, height: 400)
						}
						
						NavigationLink (destination: Gallery()){
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
							Image("HomeOwnersGuideCard")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:400, height: 130)
								.offset(x: 0.0, y: 0.0)
							
						}
						ZStack{
							Image("EmptyMenuBar")
								.resizable()
								.frame(width:800 )
								.offset(x: 0.0, y: 50.0)
							VStack {
								Image("HomeLogo")
									.resizable()
									.frame(width:80, height: 80 )
								.offset(x: 10.0, y: 25.0)
								Text("HOME")
									.font(.system(size: 14))
									.bold()
									.foregroundColor(.init("primaryGreen"))
									.frame(width: 45, height: 25)
									.offset(x: 0.0, y: 0.0)
							}
							HStack{
								VStack{
									Image("SFPhotoGallery")
										.resizable()
										.frame(width: 35, height: 35)
										.offset(x: -100.0, y: 110.0)
									Text("GALLERY")
										.font(.system(size: 14))
										.bold()
										.foregroundColor(.init("primaryGreen"))
										.frame(width: 65, height: 25)
										.offset(x: -100.0, y: 100.0)
								}
								VStack{
									Image("SFGuide")
										.resizable()
										.frame(width: 45, height: 30)
										.offset(x: 80.0, y: 105.0)
									Text("GUIDE")
										.font(.system(size: 14))
										.bold()
										.foregroundColor(.init("primaryGreen"))
										.frame(width: 45, height: 25)
										.offset(x: 80.0, y: 100.0)
								}
							}
						}
					}
					
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView() .environmentObject(DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 1800.0, gaugeValue: 0.0))
		
    }
}
