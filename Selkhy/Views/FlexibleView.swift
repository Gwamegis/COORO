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
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ForEach(Array(computeRows().enumerated()), id: \.offset) { index, rowItem in
                HStack {
                    ForEach(rowItem) { datum in
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
    private func computeRows() -> [[Ingredient]] {
        var rows: [[Ingredient]] = [[]]
        var currentRow = 0
        let availableWidth = UIScreen.main.bounds.size.width - 40
        
        var remainingWidth = availableWidth
        
        for element in data {
            
            let elementWith = elementsSize[element.name, default: availableWidth]
            if remainingWidth - elementWith < 0 {
                currentRow += 1
                remainingWidth = availableWidth
                rows.append([element])
            } else {
                remainingWidth = remainingWidth - elementWith
                rows[currentRow].append(element)
            }
        }
        return rows
    }
}
