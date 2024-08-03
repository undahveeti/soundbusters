//
//  mainScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct LoginScreen: View{
    
    let username: String
    
    var body: some View
    {
        VStack{
            Text("Welcome, \(username)!")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Login Success")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview{
    LoginScreen(username: "SampleUser")
}
