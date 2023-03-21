//
//  ContentView.swift
//  Renvitalize
//
//  Created by Andrea Reed on 3/12/23.
//

import SwiftUI
import AuthenticationServices
import Foundation

struct EditGauge{
	var isgaugePresented = false
	var progress: Double = 0
	mutating func present(initialProgress: Double){
		progress = initialProgress
		isgaugePresented = true
	}
}

class Records: ObservableObject {
	@Published var sentMessage: [Message] = [Message]()
}

struct Message: Identifiable {
	let id = UUID()
	var name: String
}

struct ContentView: View {
	@StateObject var records: Records = Records()
		@State private var isAddedTapped: Bool = false
		@State private var currentMessage: String = ""
	
	@StateObject private var gv = DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 1800.0, gaugeValue: 0.0, initGoal: 1800, isDonated: false)
	@State private var editGauge = EditGauge()
//	func presentGauge() {
//		gv.gaugeValue = gv.fundsRaised / gv.goal * 100}
	
	@State private var isPressed = false
	
	struct MessageItems: Identifiable {
		let id: UUID
		var items: String
	}
	
	let hours   = (Calendar.current.component(.hour, from: Date()))
	let minutes = (Calendar.current.component(.minute, from: Date()))
	
	
	var body: some View {
		
		
		NavigationView {
			ScrollView  {
				
				ZStack{
					VStack{
						HStack{
							Image("Logoletters")
								.resizable()
								.aspectRatio(contentMode: .fit )
							
								.frame(width:100, height: 100)
								.padding(.bottom, -80)
								.offset(x: 0.0, y: 0.0)
							
							NavigationLink(destination: LoginView()) {
								Image(systemName: "person.crop.circle.fill")
									.resizable()
									.aspectRatio(contentMode:
											.fit )
									.frame(width:35, height: 35)
									.offset(x: -5.0, y: 35.0)
									.foregroundColor(.init("ForestGreen"))
							}
							.padding(.top, -20)
							.padding(.leading, 200.0)
							
							
						}
						.padding(.top, -20)
						.padding(.bottom, 60)
						HStack(){
							
							NavigationLink(destination: Donate(gv: gv)) {
								//
								Image("Donate")
								
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:80, height: 30, alignment: .leading)
									.offset(x: 0.0, y: -20.0)
								
							}.padding(.trailing, 40.0)
							
							VStack{
								
								
								Gauge(value: gv.gaugeValue, in: 0...1) {
									
									
									
									
									Text("Goal $\(Int(gv.goal))")
										.bold()
										.foregroundColor(gv.gaugeValue == 100 ? .green : .init("ForestGreen"))
									
								} currentValueLabel: {
									
									Text("$\(Int(gv.fundsRaised))")
										.foregroundColor(gv.gaugeValue ==  100 ? .green : .init("ForestGreen"))
										.bold()
									
									
								} minimumValueLabel: {
									Text("0%")
										.foregroundColor(.init("ForestGreen"))
									
									
								} maximumValueLabel: {
									Text("100%")
										.foregroundColor(.init("ForestGreen"))
								}.gaugeStyle(.automatic)
									.tint(gv.gaugeValue == 100 ? .green : .init("ForestGreen"))
								
								
							}.frame(width:180, height:75)
								.offset(x: 0.0, y: -20.0)
							
						}
						
						HStack{
							Image("CurrentProjectCard")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:400, height: 600)
						}
						.offset(x: 0.0, y: -80.0)
						HStack(spacing: 25){
							VStack{
								Text("Post")
									.bold()
									.foregroundColor(.init("ForestGreen"))
								Text("12")
									.foregroundColor(.init("ForestGreen"))
							}
							VStack{
								Text("Followers")
									.bold()
									.foregroundColor(.init("ForestGreen"))
								Text("92")
									.foregroundColor(.init("ForestGreen"))
							}
							Button(action:{
								
							}, label: {
								Image( !isPressed ? "heart": "heartFilled")
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:40, height: 40)
							})
							.buttonStyle(.plain)
							.pressAction {
								isPressed = true
							} onRelease: {
								isPressed = true
							}
							
							
							
							.foregroundColor(.init("ForestGreen"))
							.font(.title)
							
							NavigationLink (destination: Gallery()) {
								Image("GalleryIcon")
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:55, height: 65)
									.padding(.top )
								
							}
							
						}
						
						
						.offset(x: 0.0, y: -150.0)
						VStack{
							Text("Current Homeowner Project")
								.foregroundColor(.init("ForestGreen"))
								.padding()
								.fontWeight(.black)
							Text("CREATED 12/23/2022")
								.font(.caption)
								.fontWeight(.light)
								.foregroundColor(.init("ForestGreen"))
							
								.offset(x: 0.0, y: -20.0)
							Text("BIO")
								.foregroundColor(.init("ForestGreen"))
								.fontWeight(.semibold)
							Text("Hi we’re the Fordson’s and we have a 1919 craftsmen we are fixing. Unfortunately our home was ravaged by multiple torrential rainstorms within a couple weeks window. This left many parts of the home uninhabitable. We have already gutted and removed debris and need a little help with funding to repair many rooms.")
								.foregroundColor(.init("ForestGreen"))
							
								.multilineTextAlignment(.leading)
								.frame(width:300)
								.padding()
							
							
						}
						.offset(x: 0.0, y: -150.0)
						HStack{
							NavigationLink(destination: HomeOwnersGuide()){
								Image("HomeOwnersGuideCard")
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:400, height: 130)
									.offset(x: 0.0, y: 0.0)
							}
							.offset(x: 0.0, y: -150.0)
							
						}
						
						ZStack{
							Image("CPActivity")
								.resizable()
								.aspectRatio(contentMode: .fit )
								.frame(width:600 )
								.offset(x: 0.0, y: -100.0)
								.opacity(0.2)
							
								
							
							VStack{
								Text(" Project Activity")
									.font(.title)
									.fontWeight(.bold)
									.foregroundColor(.init("ForestGreen"))
									.padding(.vertical, 60)
									
								
								
								ZStack {
									if !isAddedTapped {
										VStack( spacing: 10, content: {
											Button(action: {
												isAddedTapped = true
											}, label: {
												Text("Add message")
													.foregroundColor(.init("ForestGreen"))
													.font(.title2)
													.fontWeight(.semibold)
													
													.padding(.top, 8)
											})
											
											
											VStack {
												ForEach(records.sentMessage) { message in
													HStack {
														Image("bullHorn")
															.resizable()
															.aspectRatio(contentMode: .fit )
															.frame(width:35, height: 65, alignment: .topLeading)
															.padding()
															
														VStack{
															Text("Sent \(Date(), style: .date) at \(hours):\(minutes)")
																.font(.caption)
																.fontWeight(.light)
															Text(message.name)
																.foregroundColor(.black)
																.font(.title3)
																.fontWeight(.medium)
																.padding(.all, 10.0)
																.frame(width: 250.0)
																.background(.white)
																.cornerRadius(9.0)
														}
														
														
													}
													.frame(width: 350, alignment: .leading)
														
												}
												if gv.isDonated == true {
//													ForEach (0..<1)
//													{ index in
														HStack {
															Image("dollarSign")
																.resizable()
																.aspectRatio(contentMode: .fit )
																.frame(width:35, height: 65, alignment: .topLeading)
																.padding()
															VStack {
																Text("Sent \(Date(), style: .date) at \(hours):\(minutes)")
																	.font(.caption)
																	.fontWeight(.light)
																Text("YAY! $\(Int(gv.fundsRaised)) WAS DONATED!!!")
																	.foregroundColor(.black)
																	.font(.title3)
																	.fontWeight(.medium)
																	.padding(.all, 10.0)
																	.frame(width: 250.0)
																	.background(.white)
																	.cornerRadius(9.0)
																	.italic()
															}
															
														}
//													}
												}
																								
												
												
											}
											// List
											.scrollContentBackground(.hidden)
										})// VStack
										
									} else {
										VStack(alignment: .center, spacing: 16, content: {
											TextField("Message", text: $currentMessage)
												.padding(.leading, 8)
												.padding(.top, -30)
												.padding(.bottom, 8)
												.frame(width: 350.0, height: 100)
												.autocapitalization(.none)
												.disableAutocorrection(true)
												.border(Color(UIColor.separator))
											Button(action: {
												records.sentMessage.append(Message(name: currentMessage))
												currentMessage = ""
												isAddedTapped = false
											}, label: {
												Text("Add")
													.font(.subheadline)
													.fontWeight(.semibold)
											})// Button
											.frame(width: 48, height: 8)
											.foregroundColor(.init("ForestGreen"))
											.padding()
											.background(Color.white)
											.cornerRadius(8)
										})// VStack
										.frame(width: 180, height: 80, alignment: .center)
									}
									}
								Spacer()
									}
									
								}//ZStack
								.frame(width: 350)
								
								Spacer()
								
							
						
					}
					}
				Spacer()
				
				
				
				}
			}
		}
	}
	
	
	
	
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
		
			ContentView()
			
		}
	}
