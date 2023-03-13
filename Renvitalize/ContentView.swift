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
	@Published var students: [Student] = [Student]()
}

struct Student: Identifiable {
	let id = UUID()
	var name: String
}

struct ContentView: View {
	@ObservedObject var records: Records = Records()
		@State private var isAddedTapped: Bool = false
		@State private var studentName: String = ""
	
	@EnvironmentObject private var gv: DeclarationsViewModel
	@State private var editGauge = EditGauge()
	func presentGauge() {
		gv.gaugeValue = gv.fundsRaised / gv.goal * 100}
	@State private var isPressed = false
	
	struct MessageItems: Identifiable {
		let id: UUID
		var items: String
	}
	
	
	
	
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
							
							NavigationLink(destination: Donate()) {
								//
								Image("Donate")
								
									.resizable()
									.aspectRatio(contentMode: .fit )
									.frame(width:80, height: 30, alignment: .leading)
									.offset(x: 0.0, y: -20.0)
								
							}.padding(.trailing, 40.0)
							
							VStack{
								
								let gaugeValue = gv.fundsRaised / gv.goal * 100
								
								Gauge(value: gaugeValue, in: 0...100) {
									
									
									
									
									Text("Goal $\(Int(gv.goal))")
										.bold()
										.foregroundColor(gaugeValue == 100 ? .green : .init("ForestGreen"))
									
								} currentValueLabel: {
									
									Text("$\(Int(gv.fundsRaised))")
										.foregroundColor(gaugeValue ==  100 ? .green : .init("ForestGreen"))
										.bold()
									
									
								} minimumValueLabel: {
									Text("0%")
										.foregroundColor(.init("ForestGreen"))
									
									
								} maximumValueLabel: {
									Text("100%")
										.foregroundColor(.init("ForestGreen"))
								}.gaugeStyle(.automatic)
									.tint(gaugeValue == 100 ? .green : .init("ForestGreen"))
								
								
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
							Text("Hi we’re the Fordson’s and we have a 1919 craftsmen we are fixing. Unfortunately our home was ravaged by multiple torrential rainstorms within a couple weeks window. This left many parts of the home uninhabitable. We have already gutted and removed debris and need a little help with funding to repair many room.")
								.foregroundColor(.init("ForestGreen"))
							
								.multilineTextAlignment(.center)
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
							HStack{
								Text("Project Activity")
									.font(.title)
									.fontWeight(.bold)
									.frame(maxHeight: .infinity, alignment: .top)
									.foregroundColor(.init("ForestGreen"))
									.padding(.top, 50)
								
							}
							
							VStack{
								
								ZStack {
									if !isAddedTapped {
										VStack( spacing: 8, content: {
											Button(action: {
												isAddedTapped = true
											}, label: {
												Text("Add message")
													.foregroundColor(.init("ForestGreen"))
													.font(.title2)
													.fontWeight(.semibold)
													
													.padding(.top, 100)
											})
											List {
												ForEach(records.students) { student in
													Text(student.name)
														.foregroundColor(.black)
														.font(.title3)
														.fontWeight(.medium)
														
												}
												
											}
											// List
											.scrollContentBackground(.hidden)
										})// VStack
										
									} else {
										VStack(alignment: .center, spacing: 16, content: {
											TextField("Message", text: $studentName)
												.padding(.leading, 8)
												.padding(.top, 8)
												.padding(.bottom, 8)
												.autocapitalization(.none)
												.disableAutocorrection(true)
												.border(Color(UIColor.separator))
											Button(action: {
												records.students.append(Student(name: studentName))
												studentName = ""
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
										.padding(.top, 100)
										
										
									}
									
								}//ZStack
								.frame(width: 350, height: .infinity)
								
								Spacer()
								
							}
						}
					}
					}
				Spacer()
				
				
				
				}
			}
		}
	}
	
	
	
	
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
		
			ContentView() .environmentObject(DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 1800.0, gaugeValue: 0.0, initGoal: 0))
			
		}
	}

