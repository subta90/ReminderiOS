//
//  MainTableViewCellModel.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/02/06.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxSwift

final class MainTableViewCellModel {
    func isInfoButtonHidden(text: String) -> Bool {
        return text.count == 0
    }
}
