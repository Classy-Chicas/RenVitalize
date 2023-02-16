//
//  ContentView.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/1/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
//    let goal: Double
//    let fundsRaised: Double
//    var precentageRaised: Double{
//        fundsRaised/goal * 100
//    }

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
//Deleted sign up as it is repetitive to login
                                
                            }
                            
                        }.padding(.bottom, 20)
                        HStack(){
                            Image("Donate")
                                
                                .resizable()
                                .aspectRatio(contentMode: .fit )
                                .frame(width:90, height: 30, alignment: .leading)
                                .offset(x: -10.0, y: 0.0)
                            
                               
 //donate progression gauge
// TODO: input code snippet from Cory
                            
                            var gaugeValue = 50.0
                            Text("GOAL")
                                .foregroundColor(.init("primaryGreen"))
                                .fontWeight(.bold)
                                .font(.callout)
                                .offset(x: 100.0, y: 0.0)
                                .baselineOffset(80)
                            
                            Gauge(value: gaugeValue, in: 0...100) {
                                
                            } currentValueLabel: {
                                Text("50% Complete")
                                    .foregroundColor(gaugeValue == 100 ? .green : .init("primaryGreen"))
                            } minimumValueLabel: {
                                Text("0")
                            } maximumValueLabel: {
                                Text("100")
                            }.gaugeStyle(.automatic)
                                .tint(gaugeValue == 100 ? .green : .init("primaryGreen"))
                                
                        }
                        .frame(width:300, height:100, alignment: .trailing)
                        
                            
                        HStack{
                            Image("CurrentProjectCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit )
                                .frame(width:300, height: 400)
                            
                        }
                        NavigationLink(destination: //TODO: change navigation to previous project
                                       LoginView()) {
                            Image("SeeAll")
                                                            .resizable()
                                                                .aspectRatio(contentMode: .fit )
                                                                .frame(width:75, height: 25)
                                                                .offset(x: 90.0, y: -35.0)
                                                            
                        }
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
                                .aspectRatio(contentMode: .fit )
                                .frame(width:600 )
                                .offset(x: 0.0, y: -20.0)
                        }
                    }
                    
                }
            }
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
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
