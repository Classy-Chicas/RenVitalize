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
                    Image("Logout")
                }
                Image("Contractor Profile")
                Form{
                    TextField("Company Name", text: $companyName)
                    TextField("Email",text:  $email)
                    TextField("License Number",text:  $licenseNumber)
                    TextField("Company Address",text:  $companyAddress)
                    TextField("City",text:  $city)
                    TextField("State",text:  $state)
                    TextField("Zip Code",text:  $zipCode)
                }
                Form{
                    TextField("First Name",text:  $firstName)
                    TextField("Last Name",text:  $lastName)
                    TextField("Title",text:  $title)
                    TextField("Phone Number",text:  $phoneNumber)
                }
            }
        }
}    }


struct ContractorProfile_Previews: PreviewProvider {
    static var previews: some View {
        ContractorProfile()
    }
}
