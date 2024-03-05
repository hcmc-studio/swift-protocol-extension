import XCTest
@testable import SwiftProtocolExtension

private let jsonDateTimeFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions.insert(.withFractionalSeconds)
    
    return formatter
}()

private let defaultDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom({ decoder in
        let container = try decoder.singleValueContainer()
        var string = try container.decode(String.self)
        if !string.contains(".") {
            string = string.replacingOccurrences(of: "Z", with: ".0Z")
        }
        
        let date = jsonDateTimeFormatter.date(from: string)
        if let date = date {
            return date
        } else {
            throw NSError(domain: "test", code: 1)
        }
    })
    
    return decoder
}()

final class SwiftProtocolExtensionTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testDeserializeEmptyResponse() throws {
        let response = """
{
  "type": "Empty",
  "metadata": {
    "acceptedAt": "2024-03-05T06:45:50.168424725Z",
    "respondedAt": "2024-03-05T06:45:50.288414181Z"
  }
}
"""
        guard let responseData = response.data(using: .utf8) else { return }
        let empty = try defaultDecoder.decode(EmptyResponse.self, from: responseData)
    }
}
