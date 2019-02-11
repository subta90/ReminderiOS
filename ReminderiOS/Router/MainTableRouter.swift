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
    func transitionToRemindDetail(model: Driver<MainTableCellModelProtocol>)
}

final class MainTableRouter: MainTableRouterProtocol {
    
    private(set) weak var viewController: MainTableViewProtocol!
    
    let detailViewName = "RemindDetailViewController"
    
    init(viewController: MainTableViewProtocol) {
        self.viewController = viewController
    }
    
    func transitionToRemindDetail(model: Driver<MainTableCellModelProtocol>) {
        let detailViewController = UINib(nibName: detailViewName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RemindDetailViewController
        detailViewController.beginObserveToModel(model: model)
        
        let viewModel = RemindDetaialViewControllerViewModel(model: model)
        
        detailViewController.viewModel = viewModel
        
        viewController.pushViewController(detailViewController, animated: true)
    }
}
