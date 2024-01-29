//
//  ResponseType.swift
//
//
//  Created by Ji-Hwan Kim on 1/23/24.
//

import Foundation

public enum ResponseType: String, Codable {
    case Empty,
         Object,
         Array,
         Error
}
