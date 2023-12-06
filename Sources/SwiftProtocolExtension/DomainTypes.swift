//
//  DomainTypes.swift
//  
//
//  Created by Ji-Hwan Kim on 10/12/23.
//

import Foundation

public protocol Creatable {
    var createdAt: Date { get }
}

public protocol Modifiable {
    var lastModifiedAt: Date? { get }
}

@available(*, deprecated, renamed: "Concealable", message: "Use Concealable instead.")
public protocol Deletable {
    var deletedAt: Date? { get }
}

public protocol Concealable {
    var concealedAt: Date? { get }
}

public extension Modifiable {
    var isModified: Bool { lastModifiedAt != nil }
}

@available(*, deprecated, renamed: "Concealable", message: "Use Concealable instead.")
public extension Deletable {
    var isDeleted: Bool { deletedAt != nil }
}

public extension Concealable {
    var isConcealed: Bool { concealedAt != nil }
}
