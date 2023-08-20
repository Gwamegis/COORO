//
//  IngredientSelectionView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/20.
//

import SwiftUI

struct IngredientSelectionView: View {
    @Binding var isShowIngredientSelection: Bool
//    @Binding var menu: Menu?
    @Binding var currentIndex: Int
    @Binding var selectedEnglishNames: [String]
    @Binding var cook: Cook

    // 재료 리스트들
    let vegetables = IngredientList.shared.vegetables
    let meats = IngredientList.shared.meats
    let dairy = IngredientList.shared.dairy
    let grain = IngredientList.shared.grain
    
    // 각 재료의 선택 여부를 저장
    @State private var vegetablesSelected: [Bool] = Array(repeating: false, count: 8)
    @State private var meatsSelected: [Bool] = Array(repeating: false, count: 4)
    @State private var dairySelected: [Bool] = Array(repeating: false, count: 4)
    @State private var grainSelected: [Bool] = Array(repeating: false, count: 2)
    
    func selectedIngredients(from items: [(name: String, english: String)], using selections: [Bool]) -> [Ingredient] {
        var ingredients: [Ingredient] = []
        
        for (index, item) in items.enumerated() {
            if selections[index] {
                ingredients.append(Ingredient(name: item.name, image: Image(item.english), isHidden: false))
            }
        }
        return ingredients
    }
    
    func onConfirmSelection() {
        let allSelectedIngredients = selectedIngredients(from: vegetables, using: vegetablesSelected) +
            selectedIngredients(from: meats, using: meatsSelected) +
            selectedIngredients(from: dairy, using: dairySelected) +
            selectedIngredients(from: grain, using: grainSelected)


        selectedEnglishNames.removeAll() // 기존 배열 클리어
        selectedEnglishNames = allSelectedIngredients.compactMap { ingredient in
            let englishName = vegetables.first(where: { $0.name == ingredient.name })?.english ??
                              meats.first(where: { $0.name == ingredient.name })?.english ??
                              dairy.first(where: { $0.name == ingredient.name })?.english ??
                              grain.first(where: { $0.name == ingredient.name })?.english

            return englishName != nil ? englishName! + "2" : nil
        }
        
        let newProduce = Cook(ingredients: allSelectedIngredients, action: nil, time: nil)

        
//        if currentIndex >= 0 && currentIndex < menu?.recipe.produce.count ?? 0 {
//            menu?.recipe.produce[currentIndex] = newProduce
//        } else {
//            menu?.recipe.produce.append(newProduce)
//        }
        cook.ingredients = newProduce.ingredients
        
        isShowIngredientSelection = false
    }



    
    // 그리드 뷰 생성 함수
    func createGridView(title: String, items: [(name: String, english: String)], selection: Binding<[Bool]>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            LazyVGrid(columns: Array(repeating: .init(), count: 4), spacing: 10) {
                ForEach(0..<items.count, id: \.self) { index in
                    ZStack {
                        Image(items[index].english) // 이미지를 영어 이름으로 사용
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                        if selection.wrappedValue[index] {
                            Rectangle()
                                .fill(Color.black.opacity(0.7))
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 80, height: 80)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .onTapGesture {
                        selection.wrappedValue[index].toggle()
                    }
                }
            }
        }
    }
    
    
    var body: some View {
        ZStack{
            Color.Background
                .ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("재료선택")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top)
                        .foregroundColor(.white)
                        .padding(.trailing, 120)
                    
                    Button(action: {
                        isShowIngredientSelection = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                
                createGridView(title: "채소코너", items: vegetables, selection: $vegetablesSelected)
                createGridView(title: "정육코너", items: meats, selection: $meatsSelected)
                createGridView(title: "유제품 코너", items: dairy, selection: $dairySelected)
                createGridView(title: "곡물 코너", items: grain, selection: $grainSelected)
                
                let totalSelected = vegetablesSelected.filter { $0 }.count +
                meatsSelected.filter { $0 }.count +
                dairySelected.filter { $0 }.count +
                grainSelected.filter { $0 }.count
                
                Button(action: onConfirmSelection) {
                    Text("\(totalSelected)가지 재료선택")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.Point)
                        .cornerRadius(10)
                }
                .opacity(totalSelected > 0 ? 1 : 0)
                .padding(.top, 20)

                
                Spacer()
            }
            .padding()
        }
    }
    
}

//struct IngredientSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientSelectionView(isShowIngredientSelection: .constant(false), menu: Menu()
//    }
//}
