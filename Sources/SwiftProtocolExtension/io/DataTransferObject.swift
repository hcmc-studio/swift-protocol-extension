//
//  DataTransferObject.swift
//  
//
//  Created by Ji-Hwan Kim on 10/12/23.
//

import Foundation

public protocol DataTransferObject: Codable {}

public protocol DataTransferObjectConsumer {
    associatedtype DTO where DTO: DataTransferObject
}

public struct EncryptedDataTransferObject: DataTransferObject {
    public let publicKey: String
    public let body: String
}
