//
//  HomeScreen.swift
//  frontend
//
//  Created by Andy Tran on 9/9/24.
//



import SwiftUI
import Foundation

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Home Screen")
                    .font(.title)
                    .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NavigationLink(destination: SongsView()) {
                        Label("Songs", systemImage: "music.note")
                    }
                    NavigationLink(destination: AlbumsView()) {
                        Label("Albums", systemImage: "rectangle.stack")
                    }
                    NavigationLink(destination: ListsView()) {
                        Label("Lists", systemImage: "list.bullet")
                    }
                    NavigationLink(destination: MembersView()) {
                        Label("Members", systemImage: "person.3")
                    }
                }
            }
        }
    }
}
