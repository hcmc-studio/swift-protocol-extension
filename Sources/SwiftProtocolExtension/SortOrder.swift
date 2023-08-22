//
//  SortOrder.swift
//  
//
//  Created by Ji-Hwan Kim on 2023/08/22.
//

import Foundation

public enum SortOrder : String, Codable {
    case asc = "ASC"
    case desc = "DESC"
    case ascNullsFirst = "ASC NULLS FIRST"
    case descNullsFirst = "DESC NULLS FIRST"
    case ascNullsLast = "ASC NULLS LAST"
    case descNullsLast = "DESC NULLS LAST"
}
