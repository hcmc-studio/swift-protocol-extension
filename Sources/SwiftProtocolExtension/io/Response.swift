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
}

public struct EmptyResponseResult: Codable {}

public struct EmptyResponse: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: EmptyResponseResult
}

public struct ObjectResponse<Result: Codable>: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: Result
}

public struct ArrayResponse<Result: Codable>: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: [Result]
}

public struct ErrorResponse: Response {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: String
    public let className: String
    public let status: Int
}
