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
    
    var filter: Filter { get }
    var order: Order { get }
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
    
    public init(eq: Int? = nil, neq: Int? = nil, less: Int? = nil, lessEq: Int? = nil, greater: Int? = nil, greaterEq: Int? = nil, inList: [Int]? = nil, notInList: [Int]? = nil) {
        self.eq = eq
        self.neq = neq
        self.less = less
        self.lessEq = lessEq
        self.greater = greater
        self.greaterEq = greaterEq
        self.inList = inList
        self.notInList = notInList
    }
}

public struct BoolElement: ListOptionFilterElement {
    public let eq: Bool?
    
    init(eq: Bool? = nil) {
        self.eq = eq
    }
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
    
    public init(eq: String? = nil, neq: String? = nil, less: String? = nil, lessEq: String? = nil, greater: String? = nil, greaterEq: String? = nil, like: String? = nil, notLike: String? = nil, inList: [String]? = nil, notInList: [String]? = nil) {
        self.eq = eq
        self.neq = neq
        self.less = less
        self.lessEq = lessEq
        self.greater = greater
        self.greaterEq = greaterEq
        self.like = like
        self.notLike = notLike
        self.inList = inList
        self.notInList = notInList
    }
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
    
    public init(eq: String? = nil, neq: String? = nil, less: String? = nil, lessEq: String? = nil, greater: String? = nil, greaterEq: String? = nil, inList: [String]? = nil, notInList: [String]? = nil) {
        self.eq = eq
        self.neq = neq
        self.less = less
        self.lessEq = lessEq
        self.greater = greater
        self.greaterEq = greaterEq
        self.inList = inList
        self.notInList = notInList
    }
}

public struct BitMaskElement<Flag: BitMaskFlag>: ListOptionFilterElement {
    public let eq: BitMask<Flag>?
    public let neq: BitMask<Flag>?
    public let includeAll: BitMask<Flag>?
    public let includeAny: BitMask<Flag>?
    public let excludeAll: BitMask<Flag>?
    
    public init(eq: BitMask<Flag>? = nil, neq: BitMask<Flag>? = nil, includeAll: BitMask<Flag>? = nil, includeAny: BitMask<Flag>? = nil, excludeAll: BitMask<Flag>? = nil) {
        self.eq = eq
        self.neq = neq
        self.includeAll = includeAll
        self.includeAny = includeAny
        self.excludeAll = excludeAll
    }
}

public struct EnumElement<Enum: Codable>: ListOptionFilterElement {
    public let eq: Enum?
    public let neq: Enum?
    public let inList: [Enum]?
    public let notInList: [Enum]?
    
    public init(eq: Enum? = nil, neq: Enum? = nil, inList: [Enum]? = nil, notInList: [Enum]? = nil) {
        self.eq = eq
        self.neq = neq
        self.inList = inList
        self.notInList = notInList
    }
}

public protocol ListOptionOrder: DataTransferObject {}
