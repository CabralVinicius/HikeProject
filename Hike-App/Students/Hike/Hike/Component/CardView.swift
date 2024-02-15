//
//  CardView.swift
//  Hike
//
//  Created by Vinicius Cabral on 14/01/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old Image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")

        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    
    var body: some View {
        
        ZStack {
            // MARK: - CARD
            CustomBackgoundView()
            VStack {
                
            // MARK: - HEADER
                VStack (alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button{
                            // ACTION: Generate a random number
                            print("The button is pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }.padding(.horizontal, 30)
                
                
                // MARK: - MAIN CONTENT
                ZStack{
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                
                // MARK: - FOOTER
                Button {
                    // Action: Generate random number
                    randomImage()
                    print("The button Esplore more is pressed.")
                    
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight,
                                .customGreenMedium],
                                           startPoint: .top,
                                           endPoint: .bottom)
                        ).shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2 )
                }
                .buttonStyle(GradientButton())
                
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
