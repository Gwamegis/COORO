//
//  CreateRecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct CreateRecipeView: View {
    
    @State var items = [ "title1", "title2", "title3", "title4" ]
    @State var currentIndex = 0
    @State var isShowIngredientSelection: Bool = false
    let spacing: CGFloat  = 10
    let itemWidth: CGFloat = 290
    let itemHeight: CGFloat = 208
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ZStack {
                Image("Pot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 240)
                Image("PotFront")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 240)
            }
            
            Carousel(items: $items,
                     currentIndex: $currentIndex,
                     spacing: spacing,
                     itemWidth: itemWidth,
                     itemHeight: itemHeight,
                     opacity: 0,
                     sizeScale: 0.1) { item in
                CarouselItemView(item: item, isShowIngredientSelection: $isShowIngredientSelection)
                    .sheet(isPresented: $isShowIngredientSelection) {
                        <#code#>
                    }
                        
                    
            }
                     .padding(.bottom, 50)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("완료")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.Point)
                    )
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .background(Color.Background)
        .navigationBarBackButtonHidden()
        .navigationTitle("레시피 등록")
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeView()
    }
}
