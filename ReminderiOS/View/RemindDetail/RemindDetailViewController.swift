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

class RemindDetailViewController: UIViewController {
    
    // MARK: Constants
    let messageCellIdentifier = "RemindDetailViewMessageCell"
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = RemindDetaialViewControllerViewModel(model: Driver.of(MainTableCellModel(message: "")))
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: messageCellIdentifier, bundle: nil), forCellReuseIdentifier: messageCellIdentifier)
        tableView.dataSource = self
    }
    
    func beginObserveToModel(model: Driver<MainTableCellModelProtocol>) {
        self.viewModel.model = model
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
            
            viewModel.model.drive( onNext: { model in
                cell.messageTextField.text = model.message
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
