//
//  Response+Error.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

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
public class SerializableThrowable: Codable, Error {
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
