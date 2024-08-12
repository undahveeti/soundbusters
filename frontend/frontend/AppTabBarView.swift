//
//  AppTabBarView.swift
//  w
//
//  Created by Maxim Alayev on 8/11/24.
//

import SwiftUI

struct AppTabBarView: View {
//    @StateObject private var spotifyController: SpotifyController = SpotifyController()
    @ObservedObject var spotifyController: SpotifyController

    var body: some View {
        VStack{
            Button {
                if !spotifyController.appRemote.isConnected {
                    spotifyController.authorize()
                }
            } label: {
                Label( "Add your spotify account", systemImage: "plus" )
            }
            .onOpenURL { url in
                spotifyController.setAccessToken(from: url)
            }
            .environmentObject(spotifyController)
        }
        
    }
}

//#Preview {
//    AppTabBarView()
//}
