//
//  MainTableRouter.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol MainTableRouterProtocol: AnyObject {
    func transitionToRemindDetail(indexPath: IndexPath, message: String?)
}

final class MainTableRouter: MainTableRouterProtocol {
    
    private(set) weak var viewController: MainTableViewProtocol!
    
    let detailViewName = "RemindDetailViewController"
    
    let disposeBag = DisposeBag()
    
    init(viewController: MainTableViewProtocol) {
        self.viewController = viewController
    }
    
    func transitionToRemindDetail(indexPath: IndexPath, message: String?) {
        let detailViewController = UINib(nibName: detailViewName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RemindDetailViewController
        let model = RemindDetailModel(message: message)
        let viewModel = RemindDetailViewModel(model: Driver.of(model))
        
        detailViewController.viewModel = viewModel
        
        detailViewController.modelChangedObserve.subscribe( { [ unowned self ] model in
            let convertedModel = MainTableCellModel(message: model.element?.message)
            self.viewController.updateCellModel(indexPath: indexPath, model: convertedModel)
        })
        .disposed(by: disposeBag)
        
        viewController.pushViewController(detailViewController, animated: true)
    }
}
