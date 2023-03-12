//
//  LoginView.swift
//  NewRenVitalize
//
//  Created by Andrea Reed on 3/11/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
	
		@Environment(\.colorScheme) var colorScheme
		@AppStorage("email") var email: String = ""
		@AppStorage("firtName") var firtName: String = ""
		@AppStorage("lastName") var lastName: String = ""
		@AppStorage("userId") var userId: String = ""
		
		var body: some View {

			NavigationView{
			VStack{
				
				HStack{
					Text("Login To")
						.foregroundColor(.init("ForestGreen"))
					
						.font(.title)
						.fontDesign(.rounded)
					
					(Image("Revitalize"))
						.resizable()
						.aspectRatio(contentMode: .fit )
						.frame(width:200, height: 75)
				}
				//checking for authentication
				if userId.isEmpty                {
					SignInWithAppleButton(.signIn){
						request in
						request.requestedScopes = [.email, .fullName]
					} onCompletion: { result in
					  
						switch result {
						case .success(let auth):
							
							switch auth.credential {
							   case let credential as
							ASAuthorizationAppleIDCredential:
								let email = credential.email
								let firstName = credential.fullName?.givenName
								let lastName = credential.fullName?.familyName
								let userId = credential.user
								
								self.email = email ?? ""
								self.userId = userId
								self.firtName = firstName ?? ""
								self.lastName = lastName ?? ""
								
								
							default:
								break
							}
							
						case .failure(let error):
							print(error)
						}
					}
					.signInWithAppleButtonStyle(
						colorScheme == .dark ? .white : .black)
					.frame(width: 150, height:50 )
					.padding()
					.cornerRadius(10)
				}
				//user is already signed in
				else{
					//TODO: need screen to check for truth if contractor or homeowner. Single menu Menu("Continue as:") {
					//Button("Contractor"){
					//}
					//Button("Home Owner"){
					//}
				}
				
				
			}
		}
		}
	}



struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
