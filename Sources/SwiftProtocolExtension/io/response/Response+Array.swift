//
//  Response+Array.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public struct ArrayResponse<Result: Codable>: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: [Result]
    
    public init(type: ResponseType, metadata: ResponseMetadata, result: [Result]) {
        self.type = type
        self.metadata = metadata
        self.result = result
    }
}
