//
//  CustomCircleView.swift
//  Hike
//
//  Created by Chethana N P on 11/06/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient : Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.colorIndigoMedium, .colorSalmonLight], startPoint: isAnimateGradient ? .topLeading : .bottomLeading, endPoint: isAnimateGradient ? .bottomTrailing: .topTrailing)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
            
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
