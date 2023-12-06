//
//  Id.swift
//
//
//  Created by Ji-Hwan Kim on 12/6/23.
//

import Foundation

public protocol Id: Codable {
    associatedtype Value: Codable
    
    var value: Value { get }
    
    init(value: Value)
}

extension Id {
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
