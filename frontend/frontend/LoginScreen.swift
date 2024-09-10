//
//  mainScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    var username: String = "Fart"
    
    @StateObject var spotifyController = SpotifyController()
    var WelcomeMessage: String = "Login Below"
    
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if spotifyController.username.isEmpty {
                    AppTabBarView(spotifyController: spotifyController)
                } else {
                    Text("Welcome, \(spotifyController.username)!")
                        .font(.largeTitle)
                        .padding()
                    Text("\(spotifyController.playlist) sucks dude! still better than malayev's tho!")
                        .font(.subheadline)
                        .padding()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateToHome = true
                            }
                        }
                }
                
                // Hidden NavigationLink
                NavigationLink(
                    destination: HomeScreen(),
                    isActive: $navigateToHome
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Login Success")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LoginScreen(username: "Fart")
}
