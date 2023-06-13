//
//  ContentView.swift
//  SwiftAuth
//
//  Created by Bash on 13/06/2023.
//

import SwiftUI

struct LoginContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showInvalidUsernameAlert = false
    @State private var showInvalidPasswordAlert = false
    
    
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
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
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
                        authenticateUser(username: username, password: password)
                    }.alert("Invalid username", isPresented: $showInvalidUsernameAlert) {
                        Button("OK", role: .cancel) { }
                    }.alert("Invalid password", isPresented: $showInvalidPasswordAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.teal)
                    .cornerRadius(10)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            
        }
    }
    
    private func authenticateUser(username: String, password: String){
        if username.isEmpty {
            showInvalidUsernameAlert = true
            return
        }
        if password.isEmpty {
            showInvalidPasswordAlert = true
            return
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
