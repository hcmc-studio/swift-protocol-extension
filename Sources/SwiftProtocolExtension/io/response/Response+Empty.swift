//
//  Response+Empty.swift
//  
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public struct EmptyResponseResult: Codable {}

public struct EmptyResponse: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: EmptyResponseResult
    
    public init(type: ResponseType, metadata: ResponseMetadata, result: EmptyResponseResult) {
        self.type = type
        self.metadata = metadata
        self.result = result
    }
}
