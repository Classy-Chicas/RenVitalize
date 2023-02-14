//
//  LoginView.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/14/23.
//

import SwiftUI

struct LoginView: View {
    

    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Login To")
                    .foregroundColor(.init("primaryGreen"))
                    
                    .font(.title)
                    .fontDesign(.rounded)
                    
                (Image("Revitalize"))
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width:200, height: 75)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
