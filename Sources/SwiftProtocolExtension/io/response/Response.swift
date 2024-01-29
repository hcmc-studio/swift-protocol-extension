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
