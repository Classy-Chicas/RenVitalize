//
//  ContractorProfile.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/14/23.
//

import SwiftUI

struct ContractorProfile: View {
    @State var companyName: String = ""
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
                    TextField("License Number",text:  $licenseNumber)
                }
            }
        }
}    }


struct ContractorProfile_Previews: PreviewProvider {
    static var previews: some View {
        ContractorProfile()
    }
}
