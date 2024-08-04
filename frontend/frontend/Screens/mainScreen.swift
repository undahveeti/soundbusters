//
//  mainScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct mainScreen : View {
    let username : String
    var body : some View {
        VStack{
            
            Text("Welcome, \(username) to Frequency!")
                .font(.largeTitle)
                .bold()
            
        }
        .navigationTitle("Login Success")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    mainScreen(username: "SampleUser")
}
