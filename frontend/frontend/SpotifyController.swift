//
//  Spotify.swift
//  frontend
//
//  Created by Maxim Alayev on 8/11/24.
//

// secret afd41f87fc974457a4dda31358aeef5b

import Foundation
import SwiftUI
import SpotifyiOS
import Combine

@MainActor
final class SpotifyController: NSObject, ObservableObject, SPTAppRemoteDelegate {
    @Published var username: String = ""
    @Published var id: String = ""
    @Published var playlist: String = ""

    let spotifyClientID = "4039b654d5374db99e15e74919baa2e3"
    let spotifyRedirectURL = URL(string: "frq://spotify-login-callback")!
    lazy var configuration = SPTConfiguration(
        clientID: spotifyClientID,
        redirectURL: spotifyRedirectURL
    )
    
    var accessToken: String? = nil

    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = self.accessToken
        appRemote.delegate = self
        return appRemote
    }()
    
    func connect() {
        if let _ = self.appRemote.connectionParameters.accessToken {
            appRemote.connect()
        }
    }

    func disconnect() {
        if appRemote.isConnected {
            appRemote.disconnect()
        }
    }
    
    func setAccessToken(from url: URL) {
        let parameters = appRemote.authorizationParameters(from: url)
        
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            self.accessToken = accessToken
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }
        
        getProfile()
        getPlaylists()
    }
    
    func authorize() {
        self.appRemote.authorizeAndPlayURI("fart", asRadio: false, additionalScopes: ["playlist-read-private"])
    }
    
    nonisolated func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
      print("connected")
    }
    
    nonisolated func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
      print("disconnected")
    }
    
    nonisolated func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
      print("failed")
    }
    
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
      print("player state changed")
    }
    
    func getProfile() {
        guard let url = URL(string: "https://api.spotify.com/v1/me") else { fatalError("Missing URL") }
        guard accessToken != nil else { fatalError("Authenticaition failed") }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        self.username = jsonResult?["display_name"] as! String
                        self.id = jsonResult?["id"] as! String
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getPlaylists() {
        guard let url = URL(string: "https://api.spotify.com/v1/users/\(self.id)/playlists") else { fatalError("Missing URL") }
        guard accessToken != nil else { fatalError("Authenticaition failed") }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        if jsonResult?["items"] != nil {
                            var playlists = jsonResult!["items"] as! [NSDictionary]
                            var playlist = playlists[10]
                            self.playlist = playlist["name"] as! String;
                        }
                    } catch let error {
                        self.playlist = "Error decoding"
                    }
                }
            }
        }

        dataTask.resume()
    }
}

