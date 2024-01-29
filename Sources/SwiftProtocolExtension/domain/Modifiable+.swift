//
//  Modifiable+.swift
//  
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

extension Modifiable {
    public var isModified: Bool { lastModifiedAt != nil }
}
