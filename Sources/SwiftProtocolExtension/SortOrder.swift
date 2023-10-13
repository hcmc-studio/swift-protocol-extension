//
//  SortOrder.swift
//  
//
//  Created by Ji-Hwan Kim on 10/12/23.
//

import Foundation

public enum SortOrder: String, Codable {
    case ASC,
         DESC,
         ASC_NULLS_FIRST,
         DESC_NULLS_FIRST,
         ASC_NULLS_LAST,
         DESC_NULLS_LAST
}
