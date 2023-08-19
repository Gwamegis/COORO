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
    let spacing: CGFloat  = 10
    let itemWidth: CGFloat = 290
    let itemHeight: CGFloat = 208
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Carousel(items: $items,
                     currentIndex: $currentIndex,
                     spacing: spacing,
                     itemWidth: itemWidth,
                     itemHeight: itemHeight,
                     opacity: 0,
                     sizeScale: 0.1) { item in
                CarouselItemView(item: item)
            }
            
            Spacer()
        }
        .background(Color.Background)
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeView()
    }
}
