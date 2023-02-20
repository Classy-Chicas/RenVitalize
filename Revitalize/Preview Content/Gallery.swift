//
//  Gallery.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/17/23.
//

import SwiftUI
import UIKit

struct Gallery: View {
    
    var galleryItems: [GalleryItem] = []
    
    let columns = [
        GridItem(.adaptive(minimum: 350))
                  ]
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical) {
                LazyVGrid(columns: columns){
                    
                    ForEach(galleryItems) { galleryItem in
                        
                        VStack {
                            Image( galleryItem.imageString)
                                .resizable()
                                    .scaledToFit()
                                .mask(RoundedRectangle(cornerRadius: 9))
                            Text(galleryItem.cap)
                                .font(.subheadline)
                                .padding()
                            
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
        Gallery(galleryItems: galleryData)
    }
}
