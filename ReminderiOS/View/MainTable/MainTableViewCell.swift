//
//  MainTableViewCell.swift
//  ReminderiOS
//
//  Created by subta on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
    // MARK: Property
    
    @IBOutlet weak var remindInputField: UITextField!
    
    @IBOutlet weak var remindInfoButton: UIButton!
    
    private let infoButtonTappedRelay = PublishRelay<MainTableCellModelProtocol>()
    private let outOfFocusRelay = PublishRelay<MainTableCellModelProtocol>()
    
    var model: MainTableCellModelProtocol = MainTableCellModel()
    
    private lazy var viewModel = MainTableCellViewModel(inputText: remindInputField.rx.text.orEmpty.asObservable(), model: model)
    
    private let disposeBag = DisposeBag()
    
    var infoButtonTappedObservable: Observable<MainTableCellModelProtocol> {
        return infoButtonTappedRelay.asObservable()
    }
    
    var outOfFocusObservable: Observable<MainTableCellModelProtocol> {
        return outOfFocusRelay.asObservable()
    }
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        
        viewModel.inputText.map { $0.count  == 0 }
            .bind(to: self.remindInfoButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        remindInputField.rx.controlEvent(.editingDidEnd).asDriver()
            .drive(onNext: { [ unowned self ] text in
                let model = MainTableCellModel(message: self.remindInputField.text)
                self.outOfFocusRelay.accept(model)
            })
            .disposed(by: disposeBag)
        
        remindInfoButton.rx.tap.asDriver()
            .drive(onNext: { [ unowned self ] _ in
                let model = MainTableCellModel(message: self.remindInputField.text)
                self.infoButtonTappedRelay.accept(model)
            })
            .disposed(by: disposeBag)
    }
    
    func updateCell(text: String) {
        remindInputField.text = text
        remindInputField.sendActions(for: .valueChanged)
    }
    
}
