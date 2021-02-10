//
//  LoginView.swift
//  xcswiftapp
//
//  Created by Andy Chunab on 10/02/21.
//

import SwiftUI

struct LoginView: View {
    @State private var showingDetail = false
    
    @State var user: String = ""
    @State var password: String = ""
    
    @AppStorage("username") var username: String = ""
    @AppStorage("keyuser") var userkey: String = ""
    
    var defaults = UserDefaults.standard
    
    var body: some View{
        VStack {
            TextField("Ingrese su email", text: $user)
                .textFieldLogin()
            SecureField("Ingrese su password", text: $password)
                .textFieldLogin()
            Button("Acceder"){
                username = user //Asign the username from user input
                userkey = password // Asign the password from user inputkey
                
                //Validate if the account test is correct
                if username == "coder@gmail.com" && userkey == "dev123" {
                    //Storage user defaults
                    //let defaults = UserDefaults.standard
                    defaults.set(username, forKey: "userlogged")
                    defaults.set(userkey , forKey: "keyuserlogged")
                    defaults.set(true, forKey: "ISUSERLOGGEDIN")
                    defaults.synchronize()
                    showingDetail.toggle()
                } else {
                    //show alert because incorrect login
                }
            }.background(Color.blue)
            .padding(.top, 30)
            .foregroundColor((user.isEmpty || password.isEmpty) ? Color.black.opacity(0.6) : Color.white)
            .disabled(user.isEmpty || password.isEmpty)
            .sheet(isPresented: $showingDetail) {
                MovieListView()
                    }
        }.padding(.all, 30)
    }
}

extension View {
    public func textFieldLogin() -> some View {
        return self
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color.yellow)
            .frame(height: 40)
            .cornerRadius(5)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .background(Color.gray)
            //.background(Color.init(UIColor(red: 31/255, green: 155/255, blue: 222/255, alpha: 1 )))
    }
}




