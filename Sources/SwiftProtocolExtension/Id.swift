//
//  Id.swift
//
//
//  Created by Ji-Hwan Kim on 12/6/23.
//

import Foundation

public protocol Id: Codable, CustomStringConvertible {
    associatedtype Value: Codable, CustomStringConvertible
    
    var value: Value { get }
    
    init(value: Value)
}

extension Id {
    public var description: String { .init(describing: value) }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Value.self)
        self.init(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
