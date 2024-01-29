//
//  Sequence+ValueObjectConvertor.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

extension Sequence where Element: ValueObjectConverter {
    public func toValueObjects() -> [Element.VO] {
        map { $0.toValueObject() }
    }
}
