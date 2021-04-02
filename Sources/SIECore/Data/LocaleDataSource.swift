//
//  File.swift
//  
//
//  Created by addin on 31/03/21.
//

import Combine

public protocol LocaleDataSource {
  associatedtype Request
  associatedtype Response
  
  func list(request: Request?) -> AnyPublisher<[Response], Error>
  func add(entities: [Response]) -> AnyPublisher<Bool, Error>
  func addOne(entity: Request) -> AnyPublisher<Bool, Error>
  func remove(entity: Request) -> AnyPublisher<Bool, Error>

}
