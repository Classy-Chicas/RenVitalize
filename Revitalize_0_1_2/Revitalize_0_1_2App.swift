//
//  Revitalize_0_1_2App.swift
//  Revitalize_0_1_2
//
//  Created by Andrea Reed on 2/21/23.
//

import SwiftUI

@main
struct Revitalize_0_1_2App: App {
	@StateObject private var gv = DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 2.0, goal: 1800.0, gaugeValue: 3.0)
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(gv)
        }
    }
}
