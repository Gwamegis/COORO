//
//  FlexibleView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/19.
//

import SwiftUI

struct FlexibleView: View {
    var data: [Ingredient]
    @State var elementsSize: [String: CGFloat] = [:]
    let isInOrder: Bool
    
    var body: some View {
        VStack(alignment: isInOrder ? .leading : .center, spacing: 8) {
            ForEach(Array(computeRows().enumerated()), id: \.offset) { index, rowItem in
                HStack {
                    ForEach(rowItem) { datum in
                        if (isInOrder) {
                            IngredientTagView(title: datum.name)
                                .fixedSize()
                                .readSize { size in
                                    let width = size.width
                                    elementsSize[datum.name] = width
                                }
                        } else {
                            TagView(isHidden: datum.isHidden, text: datum.name)
                                .fixedSize()
                                .readSize { size in
                                    let width = size.width
                                    elementsSize[datum.name] = width
                                }
                        }
                    }
                }
            }
        }
    }
    private func computeRows() -> [[Ingredient]] {
        var rows: [[Ingredient]] = [[]]
        var currentRow = 0
        let availableWidth = UIScreen.main.bounds.size.width - 40
        
        var remainingWidth = availableWidth
        
        for element in data {
            print("element", element.name, elementsSize[element.name, default: availableWidth])
            let elementWith = elementsSize[element.name, default: availableWidth]
            if remainingWidth - elementWith >= 0 {
                rows[currentRow].append(element)
            } else {
                // start a new row
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - elementWith
        }
        return rows
    }
}
