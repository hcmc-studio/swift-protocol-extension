//
//  ValueObject.swift
//  
//
//  Created by Ji-Hwan Kim on 10/13/23.
//

import Foundation

public protocol ValueObject: DataTransferObject {}

public protocol ValueObjectConverter {
    associatedtype VO: ValueObject
    
    func toValueObject() -> VO
}

public extension Sequence where Element: ValueObjectConverter {
    func toValueObjects() -> [Element.VO] {
        map { $0.toValueObject() }
    }
}

public protocol VerboseValueObject: ValueObject {}

public protocol VerboseValueObjectConverter {
    associatedtype VVO: VerboseValueObject
    
    func toVerboseValueObject() -> VVO
}

public extension Sequence where Element: VerboseValueObjectConverter {
    func toVerboseValueObjects() -> [Element.VVO] {
        map { $0.toVerboseValueObject() }
    }
}
