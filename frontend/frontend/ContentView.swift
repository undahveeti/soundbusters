
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
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.purple
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width:300, height:50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login")
                    {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width:300, height: 50)
                    .background(Color.purple)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: LoginScreen(username: username), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                    
                        
                }
            }
        }
        .navigationBarHidden(true)
    }
    func authenticateUser(username: String, password: String)
    {
        if username.lowercased() == "georgethedog"
        {
            wrongUsername = 0
            if password.lowercased() == "woof"
            {
                wrongPassword = 0
                showingLoginScreen = true
            }
            else
            {
                wrongPassword = 2
            }
        }
        else
        {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}
