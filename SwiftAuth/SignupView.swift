//
//  SignupView.swift
//  SwiftAuth
//
//  Created by Bash on 13/06/2023.
//

import SwiftUI

struct SignupView: View {
    @State private var firstname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var telephone = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white)
                .opacity(0.15)
            Circle()
                .scale(1.4)
                .foregroundColor(.white)
            
            VStack {
                TextField("First name", text: $firstname)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Telephone", text: $telephone)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                Button("Proceed") {
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(.teal)
                .cornerRadius(10)
                
            }
        }
        .navigationTitle("Sign up")

    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
