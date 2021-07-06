//
//  JobsMenuViewController+TableView.swift
//  OddJobsApp
//
//  Created by Mac Use on 01.06.2021..
//
import UIKit

extension JobsMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return jobsMatrix.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! JobTableViewCell

        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? JobTableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? JobTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: elementInset, y: 15, width: view.bounds.width, height: 20))
        returnedView.backgroundColor = UIColor.clear
        
        let label = UILabel(frame: CGRect(x: elementInset, y: 15, width: view.bounds.width, height: 20))
        let str = jobsMatrix[section].first?.category.rawValue ?? ""
        
        label.text = str.uppercased()
        label.font = UIFont(name: Fonts.semiBold, size: 15)
        label.textColor = MainColors.darkBlue
        
        returnedView.addSubview(label)

        return returnedView
    }
}

extension JobsMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobsMatrix[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! JobCollectionViewCell
        
        if((jobsMatrix.count - 1 >= collectionView.tag) && (jobsMatrix[collectionView.tag].count - 1 >= indexPath.item)) {
            cell.set(job: jobsMatrix[collectionView.tag][indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator.setJobVC(for: jobsMatrix[collectionView.tag][indexPath.item])
    }
}
