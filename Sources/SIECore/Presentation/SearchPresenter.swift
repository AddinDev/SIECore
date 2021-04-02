//
//  File.swift
//  
//
//  Created by addin on 31/03/21.
//

import SwiftUI
import Combine

public class SearchPresenter<Response, Interactor: UseCase>: ObservableObject
where
  Interactor.Request == String, Interactor.Response == [Response] {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let _useCase: Interactor
  
  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  @Published public var keyword: String = ""
  @Published public var isSearching: Bool = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
    
    $keyword
      .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
      .removeDuplicates()
      .compactMap { $0 }
      .sink { _ in
      } receiveValue: { _ in
          self.execute()
      }.store(in: &cancellables)
    
  }
  
  public func execute() {
    isLoading = true
    _useCase.execute(request: keyword)
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { list in
        self.list = list
      }.store(in: &cancellables)
  }
  
}
