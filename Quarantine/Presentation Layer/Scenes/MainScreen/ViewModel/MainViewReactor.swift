//
//  MainViewReactor.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 06.09.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import Foundation
import RxSwift
import ReactorKit

final class MainViewRactor: Reactor {
    
    let initialState: State
    
    enum Action {
        case increase
        case decrease
    }
    
    enum Mutation {
        case increaseValue
        case decreaseValue
        case setLoading(Bool)
    }
    
    struct State {
        var value: Int
        var isLoading: Bool
    }
    
    init() {
        self.initialState = State(value: 0, isLoading: false)
    }
    
    // Action -> Mutation
     func mutate(action: Action) -> Observable<Mutation> {
       switch action {
       case .increase:
         return Observable.concat([
           Observable.just(Mutation.setLoading(true)),
           Observable.just(Mutation.increaseValue).delay(.milliseconds(500), scheduler: MainScheduler.instance),
           Observable.just(Mutation.setLoading(false)),
         ])

       case .decrease:
         return Observable.concat([
           Observable.just(Mutation.setLoading(true)),
           Observable.just(Mutation.decreaseValue).delay(.milliseconds(500), scheduler: MainScheduler.instance),
           Observable.just(Mutation.setLoading(false)),
         ])
       }
     }
    
    // Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
      case .increaseValue:
        state.value += 1

      case .decreaseValue:
        state.value -= 1

      case let .setLoading(isLoading):
        state.isLoading = isLoading
      }
      return state
    }
}
