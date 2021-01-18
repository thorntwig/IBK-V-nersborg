//
//  FeedVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-08.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    let sections = Bundle.main.decode([Section].self, from: "newsfeed.json", dateDecodingStrategy: .iso8601, keyDecodingStrategy: .useDefaultKeys)
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Report>?
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.register(ReportCell.self, forCellWithReuseIdentifier: ReportCell.reuseIdentifier)
        collectionView.register(FeedSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FeedSectionHeader.reuseIdentifier)
        collectionView.register(LatestNewsCell.self, forCellWithReuseIdentifier: LatestNewsCell.reuseIdentifier)
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
        
        createDataSource()
        reloadData()
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        setBackButton(to: "transparent")

        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setBackButton(to: "normal")
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with report: Report, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("unable to dequeue \(cellType)")
        }
        cell.configure(with: report)
        return cell
    }
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Report>(collectionView: collectionView) { collectionView, indexPath, report in
            switch self.sections[indexPath.section].type {
            case "MoreNews":
                return self.configure(NewsCell.self, with: report, for: indexPath)
            case "LatestNews":
                return self.configure(LatestNewsCell.self, with: report, for: indexPath)
            default:
                return self.configure(ReportCell.self, with: report, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FeedSectionHeader.reuseIdentifier, for: indexPath) as? FeedSectionHeader else {
                return nil
            }
            
            guard let firstReport = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstReport) else { return nil }
            if section.title.isEmpty { return nil }
            
            sectionHeader.title.text = section.title
            return sectionHeader
        }
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Report>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "MoreNews":
                return self.createNewsSection(using: section)
            case "LatestNews":
                return self.createLatestNewsSection(using: section)
            default:
                return self.createReportsSection(using: section)
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        
        layout.configuration = config
        return layout
    }
    
    func createReportsSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.66), heightDimension: .estimated(350))
        
        let layoutgroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 10)
        let layoutSection = NSCollectionLayoutSection(group: layoutgroup)
        
        layoutSection.boundarySupplementaryItems = [headerElement]
        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return layoutSection
    }
    
    func createLatestNewsSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
        let LayoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .estimated(300))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: LayoutGroupSize, subitems: [layoutItem])
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))

        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        layoutSection.boundarySupplementaryItems = [headerElement]
        layoutSection.orthogonalScrollingBehavior = .none
        
        return layoutSection
    }
    
    func createNewsSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.66), heightDimension: .estimated(250))
        
        let layoutgroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))

        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 10)
        let layoutSection = NSCollectionLayoutSection(group: layoutgroup)
        
        layoutSection.boundarySupplementaryItems = [headerElement]
        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return layoutSection
    }
    
}

extension NewsVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
             let detaildView = DetailedReportVC()
             detaildView.deleget = self
             detaildView.report = sections[indexPath.section].items[indexPath.row]
             self.navigationController?.pushViewController(detaildView, animated: true)
        case 1:
            let detailedView = DetailedNewsVC()
            detailedView.deleget = self
            detailedView.report = sections[indexPath.section].items[indexPath.row]
            self.navigationController?.pushViewController(detailedView, animated: true)
        case 2:
            let detailedView = DetailedNewsVC()
            detailedView.deleget = self
            detailedView.report = sections[indexPath.section].items[indexPath.row]
            self.navigationController?.pushViewController(detailedView, animated: true)
        default:
            print("hole")
        }
    }
}

class FeedSectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"

    let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))

        let stackView = UIStackView(arrangedSubviews: [title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)

        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Stop trying to make storyboards happen.")
    }
}

extension NewsVC: backButtonDeleget {
    
    enum displayMode {
        case transparent
        case normal
    }
    
    func setBackButton(to: String) {
        
        switch to {
        case "transparent":
            
            self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left")
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: nil, action: nil)
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.tintColor = .white
        default:
            self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backBTN")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backBTN")
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: nil, action: nil)
            
            self.navigationController?.navigationBar.tintColor = nil
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            self.navigationController?.navigationBar.shadowImage = nil
        }
    }
}
