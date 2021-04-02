//
//  File.swift
//  
//
//  Created by addin on 31/03/21.
//

import Foundation

public struct Api {
  public static let baseUrl = "https://api.rawg.io/api/games"
  public static let key = "?key=6c9c1f720d1649ce80d2b7d61eb76207"
}

public protocol EndPoint {
  var url: String { get }
}

public enum EndPoints {
  
  public enum Gets: EndPoint {
    
    case games
    case search
    
    public var url: String {
      switch self {
      case .games: return "\(Api.baseUrl)\(Api.key)"
      case .search: return "\(Api.baseUrl)\(Api.key)&search="
      }
    }
    
  }
  
}
