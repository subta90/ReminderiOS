//
//  MainTableViewCell.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
    // MARK: Property
    
    @IBOutlet weak var remindInputField: UITextField!
    
    @IBOutlet weak var remindInfoButton: UIButton!
    
    var entity: MainTableViewCellEntity = MainTableViewCellEntity()
     
    var infoRelay = BehaviorRelay<MainTableViewCellEntity?>(value: nil)
    
    private let disposeBag = DisposeBag()
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        remindInputField.rx.text.orEmpty.asDriver()
            .drive(onNext: { [ unowned self ] text in
                self.remindInfoButton.isHidden = !(text.count > 0)
                self.entity.message = text
                print("count: \(text.count)")
            })
            .disposed(by: disposeBag)
        remindInfoButton.rx.tap.asDriver()
            .drive(onNext: { [ unowned self ] _ in
                self.infoRelay.accept(self.entity)
            })
            .disposed(by: disposeBag)
    }
    
}
