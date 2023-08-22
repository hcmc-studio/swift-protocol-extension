//
//  Deletable.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol Deletable : Codable {
    var deletedAt: Date? { get }
}

public extension Deletable {
    func isDeleted() -> Bool {
        deletedAt != nil
    }
}
