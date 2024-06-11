//
//  ContentView.swift
//  Hike
//
//  Created by Chethana N P on 10/06/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.purple)
            .opacity(0.5)
            .frame(width: 100)
    }
}
struct ContentView: View {
    
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        
        //MARK: - 1. BASIC
//        AsyncImage(url: URL(string: imageURL))
        
        //MARK: - 2. SCALE
//        AsyncImage(url: URL(string: imageURL), scale: 3)
        
        //Greater the scale value smaller the image becomes
        //By default image scale would be 1.0
        
        //MARK: - 3. Placeholder image
        /*AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
        }placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)*/
        
        //MARK: - 4. Phase
        /*AsyncImage(url: URL(string: imageURL)){phase in
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "ant.circle.fill").iconModifier()
            }else{
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)*/
        
        //MARK: - 5. Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeIn(duration: 1))){phase in
            switch phase {
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
                    .transition(.scale(0.2))
            case .success(let image):
                image.imageModifier()
            case .failure(let error):
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
                
    }
}

#Preview {
    ContentView()
}
