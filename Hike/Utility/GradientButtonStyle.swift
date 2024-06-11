//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Chethana N P on 11/06/24.
//

import SwiftUI

struct GradientButtonStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
                
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
    
    
}
