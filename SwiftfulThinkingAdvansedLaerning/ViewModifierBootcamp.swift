//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingAdvansedLaerning
//
//  Created by user on 03.07.2023.
//

import SwiftUI

struct defaultTextViewModifier: ViewModifier {
    let backgroundColor : Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultTextFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(defaultTextViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Hello, world!")
                .font(.headline)
                .withDefaultTextFormatting(backgroundColor: .red)
            Text("Hello, evaryone!")
                .font(.subheadline)
                .withDefaultTextFormatting()
            Text("Hello !!!")
                .font(.title)
                .withDefaultTextFormatting(backgroundColor: .yellow)
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
