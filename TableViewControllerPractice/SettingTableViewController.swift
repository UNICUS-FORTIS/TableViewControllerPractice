//
//  SettingTableViewController.swift
//  TableViewControllerPractice
//
//  Created by LOUIE MAC on 2023/07/27.
//

//import UIKit
//
//class SettingTableViewController: UITableViewController {
//
//    
//    var totalSettings: [String] = ["공지사항", "실험실", "버전정보"]
//    var privateSettings: [String] = ["개인/보안", "알림", "채팅", "멀티프로필"]
//    var extraSettings: [String] = ["고객센터/도움말"]
//    
//    lazy var sectionArray = [totalSettings, privateSettings, extraSettings]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.rowHeight = 50
//    }
//    
//    
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return sectionArray.count
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0 :
//            return "전체 설정"
//        case 1 :
//            return "개인 설정"
//        case 2 :
//            return "기타"
//        default :
//            return "none"
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sct = section
//        switch sct {
//        case 0 :
//            return totalSettings.count
//        case 1 :
//            return privateSettings.count
//        case 2:
//            return extraSettings.count
//        default :
//            return  0
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell")!
//        switch indexPath.section {
//        case 0 :
//            cell.textLabel?.text = totalSettings[indexPath.row]
//        case 1 :
//            cell.textLabel?.text = privateSettings[indexPath.row]
//        case 2 :
//            cell.textLabel?.text = extraSettings[indexPath.row]
//        default :
//            cell.textLabel?.text = "none"
//        }
//        return cell
//    }
//}
