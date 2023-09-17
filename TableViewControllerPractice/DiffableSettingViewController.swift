//
//  DiffableSettingViewController.swift
//  TableViewControllerPractice
//
//  Created by LOUIE MAC on 2023/09/17.
//

import UIKit
import SnapKit

struct Items: Hashable {
    let title: String?
    let detail: [String]?
    let identifier = UUID()
}

class DiffableSettingViewController: UIViewController {
    
    var totalSettings: Items = Items(title: "전체 설정",
                                     detail: [ "공지사항", "실험실", "버전정보" ])
    
    var privateSettings: Items = Items(title: "개인 설정" ,
                                       detail: [ "개인/보안", "알림", "채팅", "멀티프로필" ])
    
    var extraSettings: Items = Items(title: "기타", detail: ["고객센터/도움말"])
    
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Items>!
    
    private var appearance = UICollectionLayoutListConfiguration.Appearance.insetGrouped
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        configureDataSource()
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, layoutEnvironment in
            var config = UICollectionLayoutListConfiguration(appearance: self.appearance)
            config.headerMode = .firstItemInSection
            config.showsSeparators = false
            return NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        }
    }
    
    func configureDataSource() {
        let headerRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Items> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            cell.contentConfiguration = content
            cell.accessories = [.outlineDisclosure()]
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Items> { cell, indexPath, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Int, Items>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Items) -> UICollectionViewCell? in
            if indexPath.item == 0 {
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            }
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Items>()
        let sections = [totalSettings, privateSettings, extraSettings]
        for (idx, section) in sections.enumerated() {
            snapshot.appendSections([idx])
            
            let headerItem = Items(title: section.title, detail: nil)
            snapshot.appendItems([headerItem], toSection: idx)
            
            if let items = section.detail {
                snapshot.appendItems(items.map { Items(title: $0, detail: nil) }, toSection: idx)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
