//
//  RegistrationViewViewModel.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegistrationViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        //Verifica che i campi non siano vuoti
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //Verifica che l'email contenga @ e .
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        //Password di almeno 6 caratteri
        guard password.count >= 6 else {
            return false
        }
        
        return true
        
    }
}
