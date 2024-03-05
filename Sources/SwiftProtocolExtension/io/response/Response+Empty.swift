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
    
    enum CodingKeys: CodingKey {
        case type
        case metadata
        case result
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.metadata, forKey: .metadata)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ResponseType.self, forKey: .type)
        self.metadata = try container.decode(ResponseMetadata.self, forKey: .metadata)
        self.result = .init()
    }
}
