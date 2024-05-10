//
//  RegistrationView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    
    
    var body: some View {
        ZStack {
            HeaderView(title: "MyToDos")
                .font(.system(size: 50))
                .foregroundStyle(.white)
                .bold()
        
            
        }
        .background(RoundedRectangle(cornerRadius: 25.0)
            .fill(.indigo))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        
        Form {
            
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled()
            
            CustomButtonView(title: "Create Account", background: .indigo) {
                
                viewModel.register()
            }
            
        }
        
        Spacer()
        
    }
}

#Preview {
    RegistrationView()
}
