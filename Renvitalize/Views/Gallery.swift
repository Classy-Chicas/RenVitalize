//
//  Gallery.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import SwiftUI

struct Gallery: View {
		@State private var currentPosition = 1
		private var maxValue = 8
		let galleryItems = ["Group1", "Group2", "Group3", "Group4", "Group5", "Group6", "Group7", "Group8", "Group9", "Group10", "Group11", "Group12", "Group13", "Group14", "Group15", "Group16", "Group17", "Group18"]
		
		let rows = [
			GridItem(.adaptive(minimum: 350))
					  ]
		
		var body: some View {
			NavigationView{
				GeometryReader { screen in
					let screen = screen.frame(in: .local)
					ScrollViewReader{ scroll in
						ScrollView(.horizontal) {
							LazyHGrid(rows: rows){
								
								ForEach(galleryItems, id:\.self) { galleryItem in
									
									VStack {
										Image( galleryItem)
											.resizable()
												.scaledToFit()
											.mask(RoundedRectangle(cornerRadius: 9))
										
										
										
									}
									
									
										.cornerRadius(35)
										.padding(20)
									
								}
							}
							.navigationBarTitleDisplayMode(.inline)
							.toolbar {
								ToolbarItem(placement: .principal){
									HStack{
										Image(systemName: "text.below.photo")
											.foregroundColor(.init("ForestGreen"))
											.font(.subheadline)
										Text("Gallery")
											.font(.title)
											.foregroundColor(.init("ForestGreen"))
											.bold()
										
									}
									
								}
								
							}
							
							
							
							
						}
						.onChange(of: currentPosition){ _ in
							scroll.scrollTo(currentPosition, anchor: .center)
							withAnimation(.easeInOut(duration: 0.5)){
								scroll.scrollTo(currentPosition, anchor: .center)
							}
							}
					}
				}
				
			}
		  
			
		}
	}
	


struct Gallery_Previews: PreviewProvider {
	static var previews: some View {
		Gallery()
	}
}

