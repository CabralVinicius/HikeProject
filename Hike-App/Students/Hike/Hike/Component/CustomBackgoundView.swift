//
//  CustomBackgoundView.swift
//  Hike
//
//  Created by Vinicius Cabral on 14/01/24.
//

import SwiftUI

struct CustomBackgoundView: View {
    var body: some View {
        
        
        ZStack {
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            LinearGradient(colors: [
                Color.customGreenLight,
                Color.customGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom
            ).cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgoundView()
        .padding()
}
