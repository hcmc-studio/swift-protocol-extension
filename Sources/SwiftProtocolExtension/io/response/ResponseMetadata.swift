//
//  ResponseMetadata.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public struct ResponseMetadata: Codable {
    public let acceptedAt: Date
    public let respondedAt: Date
    
    public init(acceptedAt: Date, respondedAt: Date) {
        self.acceptedAt = acceptedAt
        self.respondedAt = respondedAt
    }
}
