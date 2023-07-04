//
//  AnyTransitionBootcamp.swift
//  SwiftfulThinkingAdvansedLearning
//
//  Created by user on 03.07.2023.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0 ,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
    
}

extension AnyTransition {
    static var rotatingMy: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotatingMy(rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
}

struct AnyTransitionBootcamp: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .modifier(RotateViewModifier(rotation: 135))
//                    .transition(.move(edge: .leading))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
                    .transition(AnyTransition.rotatingMy(rotation: 360))
            }

            Spacer()
            
            Text("Click me")
                .withDefaultTextFormatting(backgroundColor: .red)
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
