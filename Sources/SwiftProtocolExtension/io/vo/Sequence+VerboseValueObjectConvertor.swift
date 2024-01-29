//
//  Sequence+VerboseValueObjectConvertor.swift
//  
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

extension Sequence where Element: VerboseValueObjectConverter {
    public func toVerboseValueObjects() -> [Element.VVO] {
        map { $0.toVerboseValueObject() }
    }
}
