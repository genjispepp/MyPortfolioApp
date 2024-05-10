//
//  HeaderView.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import SwiftUI

struct HeaderView: View {
    //Proprietà
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    @State var title: String
    
    
    //Funzioni
    
    //Coordinate random
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //Grandezza random
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    //Scala random
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //Velocità random
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    //Ritardo random
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id:\.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(),y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
            
            Text(title)
        }//Fine zstack
        .frame(width: 400, height: 400)
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .drawingGroup()
    }
}

#Preview {
    HeaderView(title: "Value")
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.green)
        )
}
