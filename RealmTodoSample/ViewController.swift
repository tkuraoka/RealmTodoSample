//
//  ViewController.swift
//  RealmTodoSample
//
//  Created by 倉岡隆志 on 2020/02/28.
//  Copyright © 2020 倉岡隆志. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource {

    var itemList: Results<TodoModel>!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let realm = try! Realm()
        self.itemList = realm.objects(TodoModel.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let items:TodoModel = self.itemList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = items.item
        return cell
    }

    @IBAction func addButton(_ sender: Any) {
        
        let insTodoModel:TodoModel = TodoModel()
        insTodoModel.item = self.textField.text
        
        let insRealm = try! Realm()
        try! insRealm.write {
            insRealm.add(insTodoModel)
        }
        
        tableView.reloadData()
    }
    
    
}

