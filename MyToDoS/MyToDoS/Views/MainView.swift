//
//  ContentView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                
                accountView
                
            } else {
                LoginView()
            }
        }
    }
     
    @ViewBuilder
    var accountView: some View {
        ToDoListView(userId: viewModel.currentUserId)
    }
    
}

#Preview {
    MainView()
}
