//
//  CompleteCreateRecipeView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/20.
//

import SwiftUI

struct CompleteCreateRecipeView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
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
                    .offset(y: isAnimating ? 0 : -10)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5).repeatForever(autoreverses: true))
                
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
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text("레시피 등록 완료")
                    .font(.system(size: 20, weight: .bold ))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    NavigationUtil.popToRootView()
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold ))
                }
            }
        }
    }
}

struct CompleteCreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteCreateRecipeView(name: "자취생 만랩 볶음밥")
    }
}
