//
//  Id.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol Id<Value> : Codable where Value : Codable {
    associatedtype Value
    
    var value: Value { get }
}
