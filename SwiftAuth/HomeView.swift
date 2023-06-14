//
//  HomeView.swift
//  SwiftAuth
//
//  Created by Bash on 14/06/2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var firstName: String = UserDefaults.standard.string(forKey: Keys.firstnameKey) ?? ""
    @State private var username: String = UserDefaults.standard.string(forKey: Keys.usernameKey) ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: Keys.emailKey) ?? ""
    @State private var telephone: String = UserDefaults.standard.string(forKey: Keys.telephoneKey) ?? ""
    
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
                Text("Home")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                Text(firstName)
                    .font(.body)
                    .foregroundColor(.teal)
                Text(username)
                    .font(.body)
                    .foregroundColor(.teal)
                Text(email)
                    .font(.body)
                    .foregroundColor(.teal)
                Text(telephone)
                    .font(.body)
                    .foregroundColor(.teal)
                Button("Log Out") {
                   logOut()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(.teal)
                .cornerRadius(10)
            }
        }
    }
    
    private func logOut(){
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
        dismiss()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
