//
//  ButtonStyleBootcamp.swift
//  SwiftfulThinkingAdvansedLaerning
//
//  Created by user on 03.07.2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.8) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.1 : 0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    func withPressableButtonStyle(scaledAmount: CGFloat = 0.8) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        VStack (spacing: 30){
            Button {
                
            } label: {
                Text("Click Me")
                    .font(.headline)
                    .withDefaultTextFormatting(backgroundColor: .red)
            }
//            .buttonStyle(PressableButtonStyle(scaledAmount: 0.6))
            .withPressableButtonStyle(scaledAmount: 1.2)
            .padding(.horizontal, 60)

            
            Button {
                
            } label: {
                Text("Click Me 1")
                    .font(.headline)
                    .withDefaultTextFormatting()
            }
            .buttonStyle(PressableButtonStyle(scaledAmount: 0.5))
            .padding(.horizontal, 50)
            
            Button {
                
            } label: {
                Text("Click Me Too")
                    .font(.headline)
                    .withDefaultTextFormatting(backgroundColor: .yellow)
            }
            .buttonStyle(DefaultButtonStyle())
            .padding(.horizontal, 40)
        }
        
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
