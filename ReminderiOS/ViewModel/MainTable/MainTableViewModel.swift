//
//  MainTableViewControllerViewModel.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol MainTableViewModelProtocol {
   
    var router: MainTableRouterProtocol { get }
    
    func didTappedInfoButton(message: String?)
}

final class MainTableViewModel: MainTableViewModelProtocol {
    
    let router: MainTableRouterProtocol
    
    // MARK: Life Cycle
    init(router: MainTableRouterProtocol) {
        self.router = router
    }
    
    // MARK: Transition
    
    func didTappedInfoButton(message: String?) {
        router.transitionToRemindDetail(message: message)
    }
    
    
}
