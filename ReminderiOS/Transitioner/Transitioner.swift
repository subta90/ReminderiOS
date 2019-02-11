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
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func present(viewController: UIViewController, animated: Bool, completion: (() -> ())?)
    func dismiss(animated: Bool, completion:(() -> ())?)
}

extension Transitioner {
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: animated)
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion: (() -> (()))?) {
        guard let navigationController = navigationController else { return }
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool, completion:(() -> ())?) {
        guard let navigationController = navigationController else { return }
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
}
