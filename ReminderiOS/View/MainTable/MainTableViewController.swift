//
//  MainTableViewController.swift
//  ReminderiOS
//
//  Created by subta on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol MainTableViewProtocol: AnyObject, Transitioner where Self: UIViewController {

    func updateCellModel(indexPath: IndexPath, model: MainTableCellModelProtocol)

}

class MainTableViewController: UIViewController, MainTableViewProtocol {
    
    // MARK: Constants
    let cellIdentifier = "MainTableViewCell"
    let detailViewName = "RemindDetailViewController"
    
    private let disposeBag = DisposeBag()
        
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel: MainTableViewModelProtocol = {
        let router = MainTableRouter(viewController: self)
        return MainTableViewModel(router: router)
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.itemsObservable.bind(to: tableView.rx.items) { [ unowned self ] tableView, row, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! MainTableViewCell
            cell.updateCell(text: element.message!)
            cell.infoButtonTappedObservable.subscribe( { [ unowned self ] value in
                self.viewModel.didTappedInfoButton(indexPath: tableView.indexPath(for: cell)!, message: value.element?.message)
            })
            .disposed(by: self.disposeBag)
            return cell
        }
        .disposed(by: disposeBag)
    }
    
    func updateCellModel(indexPath: IndexPath, model: MainTableCellModelProtocol) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MainTableViewCell else {
            return
        }
        cell.updateCell(text: model.message!)
    }
}
