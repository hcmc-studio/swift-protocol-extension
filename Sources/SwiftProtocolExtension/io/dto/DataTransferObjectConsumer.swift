//
//  DataTransferObjectConsumer.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public protocol DataTransferObjectConsumer {
    associatedtype DTO where DTO: DataTransferObject
}
