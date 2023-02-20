//
//  GalleryData.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/18/23.
//


import Foundation

    struct GalleryItem: Identifiable {
        var id = UUID()
        var cap: String
        var imageString: String
}

let galleryData = [GalleryItem(cap: "Torrential rain's moisture caused mold to grown on everything", imageString: "Group1"),
                   GalleryItem(cap: "Plaster and drywall dropped from ceiling", imageString: "Group2"), GalleryItem(cap: "Paint chipped and cracked", imageString: "Group3"), GalleryItem(cap: "Cutout portions of plaster where mold was worst", imageString: "Group4"), GalleryItem(cap: "Plaster fell from ceilings", imageString: "Group5"), GalleryItem(cap: "Tore ceiling completely down", imageString: "Group6"), GalleryItem(cap: "After tearing down ceiling black mold was confirmed", imageString: "Group7"), GalleryItem(cap: "Found an exposed ceiling example as inspiration on the net", imageString: "Group8"), GalleryItem(cap: "Planned out dimensions and layout", imageString: "Group9"), GalleryItem(cap: "The painting and mold treatment began", imageString: "Group10"), GalleryItem(cap: "Water had caused the wood floors to buckle, requiring replacement", imageString: "Group11"), GalleryItem(cap: "Floors replaced! YAY!", imageString: "Group12"), GalleryItem(cap: "Much better", imageString: "Group13"), GalleryItem(cap: "Home owner was extremely happy the black mold was gone!", imageString: "Group14"), GalleryItem(cap: "Relief!", imageString: "Group15"), GalleryItem(cap: "LOOK! No more mold.", imageString: "Group16"), GalleryItem(cap: "THANK YOU EVERYONE!!!!", imageString: "Group17"), GalleryItem(cap: "You're my awesome rockstars forever!", imageString: "Group18")]


