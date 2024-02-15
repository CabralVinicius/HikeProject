//
//  CustomCircleView.swift
//  Hike
//
//  Created by Vinicius Cabral on 09/02/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    //Animation Gradient
    @State private var isAnimationGradient: Bool = false
    
    
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors:
                                    [
                                        .customIndigoMedium,
                                        .customSalmonLight
                                    ],
                                   startPoint: isAnimationGradient ? .topLeading : .topLeading,
                                   endPoint: isAnimationGradient ? .bottomLeading : .bottomTrailing
                                  )
                ).onAppear(){
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimationGradient.toggle()
                    }
                }
            MotionAnimationView()
        }//: ZSTACK
            .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
