//
//  BitMask.swift
//  
//
//  Created by Ji-Hwan Kim on 10/12/23.
//

import Foundation

public protocol BitMaskFlag {
    var value: Int { get }
}

public struct BitMask<Flag> where Flag: BitMaskFlag {
    public var value: Int
    
    public init(flags: Flag...) {
        self.value = flags.reduce(0) { partialResult, flag in partialResult | flag.value }
    }
    
    public init(value: Int) {
        self.value = value
    }
}

extension BitMask {
    public func isEnabled(flag: Flag) -> Bool {
        value & flag.value != 0
    }
    
    public func isDisabled(flag: Flag) -> Bool {
        value & flag.value == 0
    }
}

extension BitMask {
    @discardableResult
    public mutating func set(flag: Flag, value: Bool) -> Bool {
        let prev = isEnabled(flag: flag)
        if value {
            enable(flag: flag)
        } else {
            disable(flag: flag)
        }
        
        return prev
    }
    
    public mutating func enable(flag: Flag) {
        value = value | flag.value
    }
    
    public mutating func disable(flag: Flag) {
        value = value ^ flag.value
    }
    
    public mutating func enableIf(flag: Flag, condition: Bool) {
        enableIf(flag: flag, predicate: { _ in condition })
    }
    
    public mutating func enableIf(flag: Flag, predicate: (Self) -> Bool) {
        if predicate(self) {
            enable(flag: flag)
        }
    }
    
    public mutating func disableIf(flag: Flag, condition: Bool) {
        disableIf(flag: flag, predicate: { _ in condition })
    }
    
    public mutating func disableIf(flag: Flag, predicate: (Self) -> Bool) {
        if predicate(self) {
            disable(flag: flag)
        }
    }
    
    public mutating func inverse(flag: Flag) {
        set(flag: flag, value: isDisabled(flag: flag))
    }
}

extension BitMask: Comparable {
    public static func < (lhs: BitMask<Flag>, rhs: BitMask<Flag>) -> Bool {
        lhs.value < rhs.value
    }
    
    public static func == (lhs: BitMask<Flag>, rhs: BitMask<Flag>) -> Bool {
        lhs.value == rhs.value
    }
}

extension BitMask: Codable {
    public init(from decoder: Decoder) throws {
        self.init(value: try decoder.singleValueContainer().decode(Int.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
