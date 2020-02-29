//
//  TodoModel.swift
//  RealmTodoSample
//
//  Created by 倉岡隆志 on 2020/02/28.
//  Copyright © 2020 倉岡隆志. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object{
    
     @objc dynamic var item: String? = nil
    
}
