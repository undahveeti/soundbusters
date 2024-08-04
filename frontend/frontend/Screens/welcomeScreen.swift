//
//  welcomeScreen.swift
//  frontend
//
//  Created by Andy Tran on 8/3/24.
//

import Foundation
import SwiftUI

struct welcomeScreen : View {
    
    var body: some View {
        NavigationView {
            ZStack{
                
                Color(.indigo.opacity(0.10)).edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    // add image
                    Spacer()
                    Image(.loginPic)
                    PrimaryButton(title: "Get Started")
                    
                    NavigationLink(
                        destination: SignInScreenView(),
                        label: {
                            Text("Register")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.indigo.opacity(0.50))
                                .cornerRadius(50)
                        
                        })
                    
                    HStack{
                        Text("New around here? ")
                            .foregroundColor(.indigo.opacity(0.50))
                        Text("Register")
                            .foregroundColor(.indigo.opacity(0.80))
                    }
                }
                .padding()
                
                
            }
            
        }
    }
}

#Preview {
    welcomeScreen()
}
