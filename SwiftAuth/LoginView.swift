//
//  ContentView.swift
//  SwiftAuth
//
//  Created by Bash on 13/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showInvalidUsernameAlert = false
    @State private var showInvalidPasswordAlert = false
    @State private var showHome = false
    
    
    var body: some View {
        NavigationView {
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
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Button("Proceed") {
                        authenticateUser()
                    }.alert("Invalid username", isPresented: $showInvalidUsernameAlert) {
                        Button("OK", role: .cancel) { }
                    }.alert("Invalid password", isPresented: $showInvalidPasswordAlert) {
                        Button("OK", role: .cancel) { }
                    }.fullScreenCover(isPresented: $showHome) {
                        HomeView()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.teal)
                    .cornerRadius(10)
                    
                    HStack {
                        Text("Dont have an account?")
                            .font(.footnote)
                            .foregroundColor(.black)
                        NavigationLink {
                            SignupView()
                        } label: {
                            Text("Create one")
                                .font(.footnote)
                                .foregroundColor(.teal)
                        }
                        
                    }
                }
            }
            .navigationTitle("Login")
        }
        .accentColor(.black)

    }
    
    private func authenticateUser(){
        if username.isEmpty {
            showInvalidUsernameAlert = true
            return
        }
        if password.isEmpty {
            showInvalidPasswordAlert = true
            return
        }
        UserDefaults.standard.set(username, forKey: Keys.usernameKey)
        showHome = true
        username = ""
        password = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
