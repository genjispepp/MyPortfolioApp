//
//  ToDoListView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.logout()
                    } label: {
                        Image(systemName: "person.crop.circle.fill.badge.minus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(
                    newItemPresented:
                        
                    $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "/users/63nrmF6pIudpVqJcbXWcN7XJJt72")
}
