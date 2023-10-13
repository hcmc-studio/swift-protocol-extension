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

public struct BitMask<Flag>: Codable where Flag: BitMaskFlag {
    public var value: Int
    
    public init(flags: Flag...) {
        self.value = flags.reduce(0) { partialResult, flag in partialResult | flag.value }
    }
}

public extension BitMask {
    func isEnabled(flag: Flag) -> Bool {
        value & flag.value != 0
    }
    
    func isDisabled(flag: Flag) -> Bool {
        value & flag.value == 0
    }
}

public extension BitMask {
    @discardableResult
    mutating func set(flag: Flag, value: Bool) -> Bool {
        let prev = isEnabled(flag: flag)
        if value {
            enable(flag: flag)
        } else {
            disable(flag: flag)
        }
        
        return prev
    }
    
    mutating func enable(flag: Flag) {
        value = value | flag.value
    }
    
    mutating func disable(flag: Flag) {
        value = value ^ flag.value
    }
    
    mutating func enableIf(flag: Flag, condition: Bool) {
        enableIf(flag: flag, predicate: { _ in condition })
    }
    
    mutating func enableIf(flag: Flag, predicate: (Self) -> Bool) {
        if predicate(self) {
            enable(flag: flag)
        }
    }
    
    mutating func disableIf(flag: Flag, condition: Bool) {
        disableIf(flag: flag, predicate: { _ in condition })
    }
    
    mutating func disableIf(flag: Flag, predicate: (Self) -> Bool) {
        if predicate(self) {
            disable(flag: flag)
        }
    }
    
    mutating func inverse(flag: Flag) {
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
