//
//  BackgroundView.swift
//  Hike
//
//  Created by Chethana N P on 11/06/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            //MARK: - DEPTH
            Color(.colorGreenDark)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y:12)
            //MARK: - LIGHT
            Color(.colorGreenLight)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y:3)
            //MARK: - SURFACE
            
            LinearGradient(colors: [Color.colorGreenLight, Color.colorGreenMedium], startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
        }
        
    }
}

#Preview {
    BackgroundView()
        .padding()
}
