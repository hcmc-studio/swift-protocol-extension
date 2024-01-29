//
//  ValueObjectConverter.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public protocol ValueObjectConverter {
    associatedtype VO: ValueObject
    
    func toValueObject() -> VO
}
