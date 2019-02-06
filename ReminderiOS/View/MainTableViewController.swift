//
//  MainTableViewController.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift

class MainTableViewController: UIViewController {
    
    // MARK: Constants
    let cellIdentifier = "MainTableViewCell"
    
    private let disposeBag = DisposeBag()
        
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
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
        
        cell.infoButtonTappedRelay.subscribe( onNext: { [ unowned self ] value in
            let detailViewController = UINib(nibName: "RemindDetailViewController",
                                             bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIViewController
            self.navigationController?.pushViewController(detailViewController, animated: true)
        })
        .disposed(by: disposeBag)
        
        return cell
    }
}
