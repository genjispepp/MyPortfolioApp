//
//  LoginView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isAnimateGradient: Bool = false
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack {
            //MARK: Header
            ZStack {
                HeaderView(title: "MyToDos")
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
            
                
            }
            .background(RoundedRectangle(cornerRadius: 25.0)
                .fill(.colorGrayLight))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            //MARK: LogIn
            
           
            
            
            Form {
                //Messaggio di errore nel caso ci fossero campi vuoti
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(Color.red)
                }
                
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                CustomButtonView(title: "Log In",
                                 background: .colorGrayMedium) {
                    viewModel.login()
                }
                .padding()
            }
            
            //MARK: NewUser
            
            VStack {
                Text("New Here?")
                
                NavigationLink("Create Account", destination: RegistrationView())
            }
        }
    }
}

#Preview {
    LoginView()
}
