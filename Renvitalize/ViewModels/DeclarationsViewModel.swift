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
	var gaugeValue: Double {
		fundsRaised / goal
	}
	@Published var initGoal: Int
	
	
	
	init(donatedAmount: Double, fundsRaised: Double, goal: Double, gaugeValue: Double, initGoal: Int) {
		self.donatedAmount = donatedAmount
		self.fundsRaised = fundsRaised
		self.goal = goal
//		self.gaugeValue = gaugeValue
		self.initGoal = initGoal
		
		
		}
	
	
	
	}



