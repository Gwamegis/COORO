//
//  Int+Extension.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import Foundation

extension Int {
    func numberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: self)) ?? String(self)
        return result + "원"
    }
}
