//
//  RemindDetailViewController.swift
//  ReminderiOS
//
//  Created by subta on 2019/01/13.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private enum CellType: Int {
    case message = 0
}

protocol RemindDetailViewProtocol: AnyObject, Transitioner where Self: UIViewController {
    
}


class RemindDetailViewController: UIViewController, RemindDetailViewProtocol {
    
    // MARK: Constants
    let messageCellIdentifier = "RemindDetailViewMessageCell"
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: RemindDetailViewModel?
    
    private let modelChangedRelay = PublishRelay<RemindDetailModelProtocol>()
    
    var modelChangedObserve: Observable<RemindDetailModelProtocol> {
        return modelChangedRelay.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: messageCellIdentifier, bundle: nil), forCellReuseIdentifier: messageCellIdentifier)
        tableView.dataSource = self
    }
    
}

extension RemindDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.message.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier) as! RemindDetailViewMessageCell
            
            viewModel?.model.drive( onNext: { model in
                cell.messageTextField.text = model.message
            })
                .disposed(by: disposeBag)
            
            cell.messageObservable.subscribe({ [ unowned self ] value in
                let model = RemindDetailModel(message: value.element!)
                self.viewModel?.model = Driver.of(model)
                self.modelChangedRelay.accept(model)
            })
            .disposed(by: disposeBag)
            
            return cell
        default:
            // TODO: けす
            let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier) as! RemindDetailViewMessageCell
            return cell
        }
    }
}

