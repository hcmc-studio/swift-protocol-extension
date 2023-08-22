//
//  File.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public struct EncryptedDataTransferObject : DataTransferObject {
    let publicKey: String
    let body: String
}
