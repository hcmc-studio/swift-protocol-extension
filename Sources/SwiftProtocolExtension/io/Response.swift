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
    public let result: SerializableThrowable
    
    public init(type: ResponseType, metadata: ResponseMetadata, result: SerializableThrowable) {
        self.type = type
        self.metadata = metadata
        self.result = result
    }
}

/// 직렬화, 역직렬화 할 수 있는 Java Throwable
public class SerializableThrowable: Codable {
    public let originalClassName: String?
    public let message: String?
    public let cause: SerializableThrowable?
    public let stackTrace: [SerializableStackTraceElement]
    
    public init(originalClassName: String?, message: String?, cause: SerializableThrowable?, stackTrace: [SerializableStackTraceElement]) {
        self.originalClassName = originalClassName
        self.message = message
        self.cause = cause
        self.stackTrace = stackTrace
    }
}

public struct SerializableStackTraceElement: Codable {
    public let fileName: String?
    public let lineNumber: Int
    public let moduleName: String?
    public let moduleVersion: String?
    public let classLoaderName: String?
    public let className: String?
    public let methodName: String?
    public let isNativeMethod: Bool
    
    public init(fileName: String?, lineNumber: Int, moduleName: String?, moduleVersion: String?, classLoaderName: String?, className: String?, methodName: String?, isNativeMethod: Bool) {
        self.fileName = fileName
        self.lineNumber = lineNumber
        self.moduleName = moduleName
        self.moduleVersion = moduleVersion
        self.classLoaderName = classLoaderName
        self.className = className
        self.methodName = methodName
        self.isNativeMethod = isNativeMethod
    }
}
