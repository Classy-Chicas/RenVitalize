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
                                Image("Login")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit )
                                    .frame(width:75, height: 25)
                                
                                Image("SignUp")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit )
                                    .frame(width:75, height: 25)
                            }
                        }
                        HStack{
                            Image("CurrentProject")
                                .resizable()
                                .aspectRatio(contentMode: .fit )
                                .frame(width:300, height: 400)
                            
                        }
                        HStack{
                            Image("HomeOwnersGuide")
                                .resizable()
                                .aspectRatio(contentMode: .fit )
                                .frame(width:300, height: 130)
                            
                        }
                        HStack{
                            Image("MenuBar")
                                .resizable()
                                .aspectRatio(contentMode: .fit )
                                .frame(width:389, height: 130)
                                .offset(x: 0.0, y: 54.0)
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
