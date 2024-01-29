//
//  VerboseValueObjectConvertor.swift
//  
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public protocol VerboseValueObjectConverter {
    associatedtype VVO: VerboseValueObject
    
    func toVerboseValueObject() -> VVO
}
