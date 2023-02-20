//
//  ContractorProfile.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/14/23.
//

import SwiftUI

struct ContractorProfile: View {
    @State var companyName: String = ""
    @State var email: String = ""
    @State var licenseNumber: String = ""
    @State var companyAddress: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var title: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        NavigationView{
			
            VStack{
                HStack{
                    Image(systemName: "xmark")
						.offset(x:-100.0, y: -10.0)
                    Image("Logout")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 100)
						.offset(x:110.0, y: -5.0)
                }
                Image("Contractor Profile")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 200)
					.padding()
                Form{
                    TextField("Company Name", text: $companyName)
                    TextField("Email",text:  $email)
                    TextField("Company Address",text:  $companyAddress)
                    TextField("City",text:  $city)
                    TextField("State",text:  $state)
                    TextField("Zip Code",text:  $zipCode)
					TextField("First Name",text:  $firstName).disableAutocorrection(true)
					TextField("Last Name",text:  $lastName)
					TextField("Title",text:  $title)
					TextField("Phone Number", text: $phoneNumber)
                }
				.cornerRadius(10)
				.padding()
				
				NavigationLink(destination: Donate()) {
					Spacer(minLength: 20)
					Text("Continue")
						.bold()
					Image(systemName: "rectangle.portrait.and.arrow.right")
				}
				.offset(x:-30.0, y: -60.0)
				.foregroundColor( .init("primaryGreen"))
            }
        }
}    }


struct ContractorProfile_Previews: PreviewProvider {
    static var previews: some View {
        ContractorProfile()
    }
}
