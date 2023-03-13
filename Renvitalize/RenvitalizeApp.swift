//
//  RenvitalizeApp.swift
//  Renvitalize
//
//  Created by Andrea Reed on 3/12/23.
//

import SwiftUI

@main
struct RenvitalizeApp: App {
	@StateObject private var gv = DeclarationsViewModel(donatedAmount: 0.0, fundsRaised: 0.0, goal: 1800.0, gaugeValue: 0.0, initGoal: 1800)
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
