//
//  ShoppingTableViewController.swift
//  TableViewControllerPractice
//
//  Created by LOUIE MAC on 2023/07/27.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
        

    @IBOutlet weak var userInputTextfield: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
   
    
    var shoppingList: [String]  = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        setupUI()
        
    }
    
    func setupUI() {
        addButton.layer.cornerRadius = 15
        addButton.clipsToBounds = true
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell") as! TableViewCell
        cell.checkBoxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkBoxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        cell.likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        cell.likeButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        cell.shoppingLabel.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func addShoppingListTapped(_ sender: UIButton) {
        if userInputTextfield.text == "" {
            return
        } else {
            if let textField = userInputTextfield.text {
                shoppingList.insert(textField, at: 0)
                userInputTextfield.text = ""
                
                tableView.reloadData()
            }
        }
    }
}
