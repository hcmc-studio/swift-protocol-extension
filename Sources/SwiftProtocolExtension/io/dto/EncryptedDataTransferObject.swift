//
//  EncryptedDataTransferObject.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public struct EncryptedDataTransferObject: DataTransferObject {
    public let publicKey: String
    public let body: String
    
    public init(publicKey: String, body: String) {
        self.publicKey = publicKey
        self.body = body
    }
}
