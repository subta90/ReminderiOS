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
    
}

class MainTableViewController: UIViewController {
    
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
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainTableViewController: UITableViewDelegate {

}

extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainTableViewCell
        
        cell.infoButtonTappedObservable.subscribe( onNext: { [ unowned self ] value in
            self.viewModel.didTappedInfoButton(model: Driver.of(value))
        })
        .disposed(by: disposeBag)
        
        return cell
    }
}

extension MainTableViewController: MainTableViewProtocol {
    
}
