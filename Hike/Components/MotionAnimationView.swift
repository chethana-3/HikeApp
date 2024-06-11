//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Chethana N P on 11/06/24.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    @State var randomCircles : Int = Int.random(in: 6...12)
    @State var isAnimating : Bool = false
    
    //MARK: - Functions
    //1. Random coordinate
    func randomCoordinates() -> CGFloat{
        CGFloat.random(in: 0...256)
    }
    //2. Random size
    func randomSize() -> CGFloat{
        CGFloat.random(in: 4...80)
    }
    //3. Random scale
    func randomScale() -> CGFloat{
        CGFloat.random(in: 1...2)
    }
    //4. Random speed
    func randomSpeed() -> Double{
        Double.random(in: 0.05...1.0)
    }
    //5. Random delay
    func randomDelay() -> Double{
        Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircles, id: \.self) { item in
                Circle()
                    .foregroundStyle(Color.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinates(),
                        y: randomCoordinates()
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
                    }
                    )
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
}
