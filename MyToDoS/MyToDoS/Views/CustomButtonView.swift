//
//  CustomButtonView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    CustomButtonView(title: "Value", background: .pink) {
        //Action
    }
}
