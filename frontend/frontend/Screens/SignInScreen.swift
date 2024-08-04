//
//  SignInScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct SignInScreenView: View {
    var body : some View {
        VStack{
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            SocialLoginButton(image: Image(.spotifyLogo), text: Text("Sign up with Spotify"))
        }
    }
}


#Preview {
    SignInScreenView()
}
