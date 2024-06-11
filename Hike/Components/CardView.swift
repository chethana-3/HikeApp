//
//  CardView.swift
//  Hike
//
//  Created by Chethana N P on 11/06/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - Properties
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    @State private var showSettingsView : Bool = false
    
    func generateRandomNumber(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
//        loop that will execute the code block at least once and then repeat as long as the condition specified in while remains true.

        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                //MARK: - header
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [Color.colorGrayLight, Color.colorGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button{
                            showSettingsView.toggle()
                            print("Hike button was pressed")
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $showSettingsView, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                                                
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.colorGrayMedium)
                }
                .padding(.horizontal, 30)
                
                //MARK: - Main content
                ZStack{
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,value: imageNumber)
                }
                
                //MARK: - Footer
                Button{
                    print("Explore more button tapped")
                    generateRandomNumber()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1, y:2)
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
