//
//  HomeOwnersGuide.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import SwiftUI

struct HomeOwnersGuide: View {
	var body: some View {
		VStack{
			Image("RenVitalize")
				.resizable()
				.aspectRatio(contentMode: .fit )
				.frame(width:200, height: 75)
		Text("Routine Maintenance ")
				.font(.title)
				.padding()
		Text("Maintenance is the key to having a safe and beautiful place. Your home is your safe haven, keep it safe and sound by knowing its condition and making the best decision for your home's longevity.")
				.padding()
		Text("Roof - The roof is one of the most important components of your house. To do a simple and easy check, walk around your house look at the roof and check for warped damaged or missing shingles. Contact a professional for repair advise and estimates. Call a roofing professional immediately if you notice rain water getting into your home.")
				.padding()
			Text("Foundation - Check for cracks in the cement. Also check your basement walls for cracks. Water can begin to enter your home cause major damage to your home structure.")
				.padding()
			Text("Frame - Your home's frame should remain strong. Once the house is totally built its nearly impossible to see the frame. However you can still check the integrity of your home's frame by looking for signs of termites and damaged support beams located in your basement.")
				.padding()
			Text("Doors - Check exterior doors for drafts and sunlight shining around the structure. Caulk around those areas to prevent heat from escaping or to keep cool inside. Check interior doors for loose door knobs, tighten up any loose screws. Windows - Look at your windows structure, check for sunlight shining around the frame just like you do for your doors. Caulk those areas to prevent drafts and rain water from entering your home through the window's casement.")
				.padding()
			Text("Electrical - Check light fixtures for exposed wiring. Replace damaged electrical outlets. Electrical problems can be very hazardous. If you think you have an electrical issue call an electrician immediately.")
				.padding()
			
			}
			.offset(x: 0.0, y: -10.0)
			
		}
		
	}


struct HomeOwnersGuide_Previews: PreviewProvider {
	static var previews: some View {
		HomeOwnersGuide()
	}
}
