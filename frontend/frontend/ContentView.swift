
//
//  ContentView.swift
//  LoginPageUI
//
//  Created by Andy Tran on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingLoginScreen = false
    var body : some View {
        welcomeScreen()
    }
    
}


struct PrimaryButton: View {
    var title: String
    var body : some View{
        NavigationLink(
            destination: loginScreen(),
            label: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.indigo.opacity(0.50))
                    .cornerRadius(50)
                
                
            })
    }
}

struct SocialLoginButton: View {
    var image: Image
    var text: Text
    var body : some View {
        VStack{
            HStack{
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .padding(.horizontal)
                text
                    .font(.title2)
            
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green.opacity(0.20))
            .cornerRadius(50)
            
            
        }
    }
}
#Preview {
    ContentView()
}



