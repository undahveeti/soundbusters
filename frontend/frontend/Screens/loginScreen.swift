//
//  loginScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct loginScreen: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingMainScreen = false
    
    var body : some View {
        ZStack{
            Color.indigo.opacity(0.70)
                .ignoresSafeArea()
            
            Circle()
                .scale(1.5)
                .foregroundColor(.white)
            
            Circle()
                .scale(1.3)
                .foregroundColor(.indigo.opacity(0.30))
            
            VStack{
                Text("Log In")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.black.opacity(0.08))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width:300,  height: 50)
                    .background(.black.opacity(0.08))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                
                
                Button("Login")
                {
                    authenticateUser(username: username, password: password)
                }
                .padding()
                .frame(width: 300, height: 50)
                .background(.indigo.opacity(0.50))
                .cornerRadius(10)
                .foregroundColor(.white)
                
                NavigationLink(destination: mainScreen(username: username), isActive: $showingMainScreen){
                    EmptyView()
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
            if(password.lowercased() == "woof")
            {
                wrongPassword = 0
                showingMainScreen = true
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
    loginScreen()
}

