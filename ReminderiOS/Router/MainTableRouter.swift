//
//  MainTableRouter.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxCocoa

protocol MainTableRouterProtocol: AnyObject {
    func transitionToRemindDetail(message: String?)
}

final class MainTableRouter: MainTableRouterProtocol {
    
    private(set) weak var viewController: MainTableViewProtocol!
    
    let detailViewName = "RemindDetailViewController"
    
    init(viewController: MainTableViewProtocol) {
        self.viewController = viewController
    }
    
    func transitionToRemindDetail(message: String?) {
        let detailViewController = UINib(nibName: detailViewName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RemindDetailViewController
        detailViewController.beginObserveToModel(message: message)
        
        let model = RemindDetailModel(message: message)
        let viewModel = RemindDetailViewModel(model: Driver.of(model))
        
        detailViewController.viewModel = viewModel
        
        viewController.pushViewController(detailViewController, animated: true)
    }
}
