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

public protocol Deletable {
    var deletedAt: Date? { get }
}

public extension Modifiable {
    var isModified: Bool { lastModifiedAt != nil }
}

public extension Deletable {
    var isDeleted: Bool { deletedAt != nil }
}
