//
//  Modifiable.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol Modifiable : Creatable {
    var createdAt: Date { get }
    var lastModifiedAt: Date? { get }
}

public extension Modifiable {
    func isModified() -> Bool {
        lastModifiedAt != nil
    }
}
