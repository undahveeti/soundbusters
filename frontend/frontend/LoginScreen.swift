//
//  mainScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct LoginScreen: View{
    var username: String = "Fart"
    
    @StateObject var spotifyController = SpotifyController()
    var WelcomeMessage: String = "Login Below"

    var body: some View
    {
        VStack{
            if spotifyController.username != "" {
                Text("Welcome, \(spotifyController.username)!")
                    .font(.largeTitle)
                    .padding()
                Text("\(spotifyController.playlist) fckin sucks man!")
                    .font(.subheadline)
                    .padding()
            }
            
            AppTabBarView(spotifyController: spotifyController)
        }
        .navigationTitle("Login Success")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview{
    LoginScreen(username: "Fart")
}
