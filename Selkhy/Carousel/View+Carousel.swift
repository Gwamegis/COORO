//
//  View+Extension.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

extension View {
    
    func frame(perform: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader {
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: $0.frame(in: .global))
            }
        )
        .onPreferenceChange(FramePreferenceKey.self) { value in
            DispatchQueue.main.async {
                perform(value)
            }
        }
    }
}

struct FramePreferenceKey: PreferenceKey {
    public static var defaultValue: CGRect = .zero
    public static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}
