//
//
//  FavoriteButton.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import SwiftUI

struct PressActions: ViewModifier {
	var onPress: () -> Void
	var onRelease: () -> Void
	
	func body(content: Content) -> some View {
		content
			.simultaneousGesture(
				DragGesture(minimumDistance: 0)
					.onChanged({ _ in
						onPress()
					})
					.onEnded({ _ in
						onRelease()
					})
			)
	}
}
 
 
extension View {
	func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
		modifier(PressActions(onPress: {
			onPress()
		}, onRelease: {
			onRelease()
		}))
	}
}
