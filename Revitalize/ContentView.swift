//
//  ContentView.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/1/23.
//

import SwiftUI
import CoreData
import Foundation

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
	
//    var gaugeValue = Donations.fundsRaised / Donations.goal * 100
    
    

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
                                Spacer(minLength: 20)
                                Image("Donate")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit )
                                    .frame(width:80, height: 30, alignment: .leading)
                                    .offset(x: -215.0, y: 0.0)
                            }
							
							VStack{
								
								var gaugeValue = 50.0
															Gauge(value: gaugeValue, in: 0...100) {
																Text("Goal $9,000")
																	.bold()
											.foregroundColor(gaugeValue == 100 ? .green : .init("primaryGreen"))
															} currentValueLabel: {
																Text("50% Complete")
																	.foregroundColor(gaugeValue == 100 ? .green : .init("primaryGreen"))
															} minimumValueLabel: {
																Text("0%")
												
									
															} maximumValueLabel: {
																Text("100%")
															}.gaugeStyle(.automatic)
																.tint(gaugeValue == 100 ? .green : .init("primaryGreen"))
													
							}.frame(width:150, height:75)
								.offset(x: -150.0, y: 0.0)
                            			
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
                        HStack{
                            Image("MenuBar")
                                .resizable()
                                .frame(width:600 )
                                .offset(x: 0.0, y: -20.0)
                        }
                    }
                    
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

class Donations: ObservableObject{
    
    @Published var donatedAmount: Double
    @Published var fundsRaised: Double
    @Published var goal: Double
    @Published var gaugePercent: Double
    init(donatedAmount: Double, fundsRaised: Double, goal: Double, gaugePercent: Double) {
        self.donatedAmount = donatedAmount
        self.fundsRaised = fundsRaised
        self.goal = goal
        self.gaugePercent = gaugePercent
        func gPercent(){
            self.gaugePercent = fundsRaised / goal * 100
        }
        
    }
    
}
