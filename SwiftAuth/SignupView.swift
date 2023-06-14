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
    @State private var showIncompleteDetailsAlert = false
    @State private var showHome = false
    
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
                    .keyboardType(.emailAddress)
                TextField("Telephone", text: $telephone)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                Button("Proceed") {
                    authenticate()
                }.alert("Incomplete details", isPresented: $showIncompleteDetailsAlert) {
                    Button("OK", role: .cancel) { }
                }.fullScreenCover(isPresented: $showHome) {
                    HomeView()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(.teal)
                .cornerRadius(10)
                
            }
        }
        .navigationTitle("Sign up")

    }
    
    private func authenticate() {
        if firstname.isEmpty || username.isEmpty || email.isEmpty || telephone.isEmpty || password.isEmpty {
            showIncompleteDetailsAlert.toggle()
            return
        }
        
        UserDefaults.standard.set(firstname, forKey: Keys.firstnameKey)
        UserDefaults.standard.set(username, forKey: Keys.usernameKey)
        UserDefaults.standard.set(email, forKey: Keys.emailKey)
        UserDefaults.standard.set(telephone, forKey: Keys.telephoneKey)
        
        showHome.toggle()
        
        firstname = ""
        username = ""
        email = ""
        telephone = ""
        password = ""
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
