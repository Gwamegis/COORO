//
//  CompleteCreateRecipeView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/20.
//

import SwiftUI

struct CompleteCreateRecipeView: View {
    let name = "자취생 만렙 볶음밥"
    @State private var isAnimating = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.Background.ignoresSafeArea()
            Image("completeBg")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(isAnimating ? 0.5 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
            
            VStack(spacing: 60) {
                Spacer()
                Image("Sandwich")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 285)
                    .offset(y: isAnimating ? -10 : 10)
                    .animation(Animation.interpolatingSpring(stiffness: 200, damping: 5).repeatForever(autoreverses: true))
                
                Text("\(name)\n생성 완료!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.Point)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
            }
            .padding(.bottom, 130)
        }
        .onAppear {
            self.isAnimating = true
        }
    }
}

struct CompleteCreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteCreateRecipeView()
    }
}
