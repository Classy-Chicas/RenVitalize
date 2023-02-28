//
//  Gallery.swift
//  Revitalize_0_1_2
//
//  Created by Andrea Reed on 2/21/23.
//

import SwiftUI

struct Gallery: View {
    
		let galleryItems = ["Group1", "Group2", "Group3", "Group4", "Group5", "Group6", "Group7", "Group8", "Group9", "Group10", "Group11", "Group12", "Group13", "Group14", "Group15", "Group16", "Group17", "Group18"]
		
		let columns = [
			GridItem(.adaptive(minimum: 350))
					  ]
		
		var body: some View {
			NavigationView{
				ScrollView(.vertical) {
					LazyVGrid(columns: columns){
						
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
					.navigationTitle("Gallery")
				}
			}
		  
			
		}
	}
    


struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}
