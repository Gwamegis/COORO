//
//  IngredientSelectionView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/20.
//

import SwiftUI

struct IngredientSelectionView: View {
    @Binding var isShowIngredientSelection: Bool
    // 재료 리스트들
    let vegetables: [(name: String, english: String)] = [
        ("당근", "carrot"),
        ("대파", "greenOnion"),
        ("양파", "onion"),
        ("가지", "eggplant"),
        ("고추", "chili"),
        ("마늘", "garlic"),
        ("감자", "potato"),
        ("김치", "kimchi")
    ]
    let meats: [(name: String, english: String)] = [
        ("갈비살", "ribeye"),
        ("삼겹살", "porkBelly"),
        ("목살", "neckMeat"),
        ("베이컨", "bacon")
    ]
    let dairy: [(name: String, english: String)] = [
        ("계란", "egg"),
        ("우유", "milk"),
        ("요거트", "yogurt"),
        ("치즈", "cheese")
    ]
    let grain: [(name: String, english: String)] = [
        ("쌀밥", "rice"),
        ("땅콩", "peanut")
    ]
    
    
    // 각 재료의 선택 여부를 저장
    @State private var vegetablesSelected: [Bool] = Array(repeating: false, count: 8)
    @State private var meatsSelected: [Bool] = Array(repeating: false, count: 4)
    @State private var dairySelected: [Bool] = Array(repeating: false, count: 4)
    @State private var grainSelected: [Bool] = Array(repeating: false, count: 2)
    
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
                
                Button(action: {
                    // 필요한 액션을 여기에 작성
                    isShowIngredientSelection = false
                }) {
                    Text("\(totalSelected)가지 재료선택")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .opacity(totalSelected > 0 ? 1 : 0)  // 이 줄을 추가
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct IngredientSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSelectionView(isShowIngredientSelection: .constant(false))
    }
}
