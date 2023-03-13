//
//  DeclarationsViewModel.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import Foundation
import SwiftUI



class DeclarationsViewModel: ObservableObject {
	
	@Published var donatedAmount: Double
	@Published var fundsRaised: Double
	@Published var goal: Double
	@Published var gaugeValue: Double
	@Published var initGoal: Int
	
	
	
	init(donatedAmount: Double, fundsRaised: Double, goal: Double, gaugeValue: Double, initGoal: Int) {
		self.donatedAmount = donatedAmount
		self.fundsRaised = fundsRaised
		self.goal = goal
		self.gaugeValue = gaugeValue
		self.initGoal = initGoal
		
		
		}
	
	
	
	}



