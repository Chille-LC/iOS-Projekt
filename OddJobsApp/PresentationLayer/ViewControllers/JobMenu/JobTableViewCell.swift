//
//  JobTableViewCell.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import UIKit

class JobTableViewCell: UITableViewCell {
    //MARK: - Constants
    private let horizontalSpacing: CGFloat = 15
    private let horizontalInsets: CGFloat = 30
    
    //MARK: - View elements
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: CellDimensions.X, height: CellDimensions.Y)
        layout.minimumLineSpacing = horizontalSpacing
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: horizontalInsets, bottom: 0, right: horizontalInsets)

        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    var rowOfJobs: [Job]?
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
    
    //MARK: - Code
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(collectionView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Building Views and Constraints
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(CellDimensions.Y)
        }
    }
    
    //MARK: - Additional functions
    func setCollectionViewDataSourceDelegate<T: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: T, forRow row: Int) {
        collectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false)
        collectionView.reloadData()
    }
}
