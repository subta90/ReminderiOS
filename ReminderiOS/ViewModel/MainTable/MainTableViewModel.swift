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
    var items: [MainTableCellModel] { get set }
    var itemsObservable: Observable<[MainTableCellModel]> { get }
    
    func didTappedInfoButton(indexPath: IndexPath, message: String?)
}

final class MainTableViewModel: MainTableViewModelProtocol {
    
    let router: MainTableRouterProtocol
    
    var items: [MainTableCellModel] = [
        MainTableCellModel(message: "first"),
        MainTableCellModel(message: "second"),
        MainTableCellModel(message: "third")
    ]
    
    var itemsObservable: Observable<[MainTableCellModel]> {
        return Observable.of(items)
    }
    
    // MARK: Life Cycle
    init(router: MainTableRouterProtocol) {
        self.router = router
    }
    
    // MARK: Transition
    
    func didTappedInfoButton(indexPath: IndexPath, message: String?) {
        router.transitionToRemindDetail(indexPath: indexPath, message: message)
    }
}
