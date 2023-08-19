//
//  SelectedCookActionView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct SelectedCookActionView: View {
    
    @Binding var isShowCookActionSelection: Bool
    @Binding var cook: Cook
//    @Binding var selectedAction: CookAction?
    private let cookActions: [CookAction] = [.roast, .boil, .fry, .steam]
    
    var body: some View {
        VStack(spacing: 20) {
            
            ZStack {
                Text("조리 방법 선택")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                
                HStack {
                    Spacer()
                    Button {
                        isShowCookActionSelection.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .padding(.trailing, 20)
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 25)
            
            ForEach(cookActions.indices, id: \.self) { index in
                Button {
                    cook.action = cookActions[index]
//                    selectedAction = cookActions[index]
                    isShowCookActionSelection.toggle()
                } label: {
                    cookActions[index].getImage()
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .padding(.horizontal, 20)
                }
            }
            Spacer()
        }
        .background(Color.Background)
    }
}

//struct SelectedCookActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedCookActionView(isShowCookActionSelection: .constant(true), selectedAction: .constant(.boil))
//    }
//}
