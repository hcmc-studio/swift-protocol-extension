//
//  Response.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol Response<Result> : DataTransferObject where Result : Codable {
    associatedtype Result
    
    var type: ResponseType { get }
    var metadata: ResponseMetadata { get }
    var result: Result { get }
}

public struct ResponseMetadata : Codable {
    let acceptedAt: Date
    let respondedAt: Date
}

public enum ResponseType : String, Codable {
    case empty = "EMPTY"
    case object = "OBJECT"
    case array = "ARRAY"
    case error = "ERROR"
}

public struct EmptyResponse : Response {
    public typealias Result = EmptyBody
    
    public var type: ResponseType
    public var metadata: ResponseMetadata
    public var result: EmptyBody
    
    public struct EmptyBody : Codable {}
}

public struct ObjectResponse<Result> : Response where Result : Codable {
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: Result
}

public struct ArrayResponse<Element> : Response where Element : Codable {
    public typealias Result = [Element]
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: [Element]
}

public struct ErrorResponse : Response {
    public typealias Result = String
    
    public let type: ResponseType
    public let metadata: ResponseMetadata
    public let result: String
    public let className: String
}
