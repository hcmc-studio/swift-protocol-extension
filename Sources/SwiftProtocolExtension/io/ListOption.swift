//
//  ListOption.swift
//  
//
//  Created by Ji-Hwan Kim on 10/12/23.
//

import Foundation

public protocol ListOption: DataTransferObject {
    associatedtype Filter: ListOptionFilter
    associatedtype Order: ListOptionOrder
}

public protocol ListOptionFilter: DataTransferObject {}

public protocol ListOptionFilterElement: Codable {}

public protocol ListOptionFilterElementPrimitive: ListOptionFilterElement {
    associatedtype T
    
    var eq: T? { get }
    var neq: T? { get }
    var less: T? { get }
    var lessEq: T? { get }
    var greater: T? { get }
    var greaterEq: T? { get }
    var inList: [T]? { get }
    var notInList: [T]? { get }
}

public struct NumericElement: ListOptionFilterElementPrimitive {
    public let eq: Int?
    public let neq: Int?
    public let less: Int?
    public let lessEq: Int?
    public let greater: Int?
    public let greaterEq: Int?
    public let inList: [Int]?
    public let notInList: [Int]?
}

public struct BoolElement: ListOptionFilterElement {
    let eq: Bool?
}

public struct StringElement: ListOptionFilterElementPrimitive {
    public let eq: String?
    public let neq: String?
    public let less: String?
    public let lessEq: String?
    public let greater: String?
    public let greaterEq: String?
    public let like: String?
    public let notLike: String?
    public let inList: [String]?
    public let notInList: [String]?
}

public struct DateElement: ListOptionFilterElementPrimitive {
    public let eq: String?
    public let neq: String?
    public let less: String?
    public let lessEq: String?
    public let greater: String?
    public let greaterEq: String?
    public let inList: [String]?
    public let notInList: [String]?
}

public struct BitMaskElement<Flag: BitMaskFlag>: ListOptionFilterElement {
    public let eq: BitMask<Flag>?
    public let neq: BitMask<Flag>?
    public let includeAll: BitMask<Flag>?
    public let includeAny: BitMask<Flag>?
    public let excludeAll: BitMask<Flag>?
}

public struct EnumElement<Enum: Codable>: ListOptionFilterElement {
    public let eq: Enum?
    public let neq: Enum?
    public let inList: [Enum]?
    public let notInList: [Enum]?
}

public protocol ListOptionOrder: DataTransferObject {}
