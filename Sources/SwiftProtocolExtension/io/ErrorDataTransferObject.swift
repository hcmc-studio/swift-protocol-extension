//
//  ErrorDataTransferObject.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol ErrorDataTransferObject : Error, DataTransferObject {
    var httpStatusCode: Int { get }
}
