//
//  MainTableViewTransitioner.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit

protocol Transitioner: AnyObject where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}

extension Transitioner {
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
}
