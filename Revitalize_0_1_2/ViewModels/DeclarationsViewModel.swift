//
//  DeclarationsViewModel.swift
//  Revitalize_0_1_2
//
//  Created by Andrea Reed on 2/21/23.
//

import Foundation

class DeclarationsViewModel: ObservableObject {
	
	@Published var donatedAmount: Double
	@Published var fundsRaised: Double
	@Published var goal: Double
	@Published var gaugeValue: Double
	@Published var initGoal = Int()
	
	
	
	init(donatedAmount: Double, fundsRaised: Double, goal: Double, gaugeValue: Double) {
		self.donatedAmount = donatedAmount
		self.fundsRaised = fundsRaised
		self.goal = goal
		self.gaugeValue = gaugeValue
		
		}
	
	}


