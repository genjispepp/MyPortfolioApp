//
//  ToDoListViewViewModel.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 26/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}
