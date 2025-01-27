//
//  Endpoint.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

protocol Endpoint {
  var url: URL? { get }
  var method: HTTPMethod { get }
  var headers: [String: String] { get }
  var body: Data? { get }
}

enum HTTPMethod: String {
  case get, post, put, delete, patch
}

