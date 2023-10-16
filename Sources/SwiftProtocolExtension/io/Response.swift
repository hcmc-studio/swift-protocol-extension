//
//  Response.swift
//  
//
//  Created by Ji-Hwan Kim on 10/13/23.
//

import Foundation

public protocol Response: DataTransferObject {
    associatedtype Result
    
    var type: ResponseType { get }
    var metadata: ResponseMetadata { get }
    var result: Result { get }
}

public enum ResponseType: String, Codable {
    case Empty,
         Object,
         Array,
         Error
}

public struct ResponseMetadata: Codable {
    public let acceptedAt: Date
    public let respondedAt: Date
    
    public init(acceptedAt: Date, respondedAt: Date) {
        self.acceptedAt = acceptedAt
        self.respondedAt = respondedAt
    }
}

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

public struct ObjectResponse<Result: Codable>: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: Result
    
    public init(type: ResponseType, metadata: ResponseMetadata, result: Result) {
        self.type = type
        self.metadata = metadata
        self.result = result
    }
}

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

public struct ErrorResponse: Response, Error {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: String
    public let className: String
    public let status: Int
    
    public init(type: ResponseType, metadata: ResponseMetadata, result: String, className: String, status: Int) {
        self.type = type
        self.metadata = metadata
        self.result = result
        self.className = className
        self.status = status
    }
}
