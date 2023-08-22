//
//  File.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public protocol Creatable : Codable {
    var createdAt: Date { get }
}
