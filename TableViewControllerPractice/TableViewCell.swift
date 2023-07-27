//
//  TableViewCell.swift
//  TableViewControllerPractice
//
//  Created by LOUIE MAC on 2023/07/27.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    

}
