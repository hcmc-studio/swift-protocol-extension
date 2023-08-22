//
//  BitMask.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public struct BitMask<E> where E : BitMaskFlag {
    private(set) public var value: Int
    
    public init(_ initialValue: Int) {
        value = initialValue
    }
    
    public init(_ flags: E...) {
        value = 0
        for flag in flags {
            value |= flag.value
        }
    }
    
    public func isEnabled(_ flag: E) -> Bool {
        return (value & flag.value) != 0
    }
    
    public func isDisabled(_ flag: E) -> Bool {
        return (value & flag.value) == 0
    }
    
    public subscript(_ flag: E) -> Bool {
        get {
            return isEnabled(flag)
        }
        mutating set {
            if newValue {
                enable(flag)
            } else {
                disable(flag)
            }
        }
    }
    
    public mutating func enable(_ flag: E) {
        value |= flag.value
    }
    
    public mutating func enableIf(_ condition: Bool, _ flag: E) {
        if condition {
            enable(flag)
        }
    }
    
    public mutating func disable(_ flag: E) {
        value &= ~flag.value
    }
    
    public mutating func disableIf(_ condition: Bool, _ flag: E) {
        if condition {
            disable(flag)
        }
    }
    
    public mutating func inverse(_ flag: E) {
        self[flag] = isDisabled(flag)
    }
    
    public func toString() -> String {
        return String(value, radix: 2)
    }
}

extension BitMask: Codable {
    public init(from decoder: Decoder) throws {
        self.init(try decoder.singleValueContainer().decode(Int.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
