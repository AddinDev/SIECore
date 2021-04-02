//
//  File.swift
//  
//
//  Created by addin on 31/03/21.
//

import Foundation
import Combine

public struct Interactor<Request, Response, R: Repository>: UseCase where R.Request == Request, R.Response == Response {
  
  private let _repository: R
  
  public init(repository: R) {
    _repository = repository
  }

  public func execute(request: Request?) -> AnyPublisher<Response, Error> {
    _repository.execute(request: request)
    
  }
  
}
