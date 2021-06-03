//
//  JobsMenuViewController.swift
//  OddJobsApp
//
//  Created by Mac Use on 31.05.2021..
//

import UIKit
import SnapKit

class JobsMenuViewController: UIViewController {

    //MARK: - Constants
    private let heightElementDistance: CGFloat = 36
    private let gradientRectHeight: CGFloat = 130
    
    //MARK: - VC elements
    private var searchGradientRectangle: UIView!
    private var searchTextField: CustomTextField!
    private var jobsLabel: UILabel!
    private var jobsTableView: UITableView!
    
    let model: [[Job]] = generateRandomData()
    
    //TableViewVars
    var storedOffsets = [Int: CGFloat]()
    
    //MARK: - Code
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        buildViews()
        addConstraints()
    }
    
    //MARK: - Building Views and Constraints
    private func buildViews() {
        view.backgroundColor = .white
        
        createSearchGradientRectangle()
        createSearchTextField()
        createJobsLabel()
        createJobsTableView()
        
        view.addSubview(searchGradientRectangle)
        view.addSubview(searchTextField)
        view.addSubview(jobsLabel)
        view.addSubview(jobsTableView)
    }
    
    private func createSearchGradientRectangle() {
        searchGradientRectangle = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: gradientRectHeight + 50))
        let gradient = CAGradientLayer()
        
        gradient.frame = searchGradientRectangle.bounds
        gradient.colors = gradientColors
        gradient.cornerRadius = 45
        searchGradientRectangle.layer.addSublayer(gradient)
        
        //Corner radius
        searchGradientRectangle.layer.cornerRadius = 45
        searchGradientRectangle.layer.masksToBounds = false
        
        //Shadow
        searchGradientRectangle.layer.shadowRadius = 4.0
        searchGradientRectangle.layer.shadowOpacity = 0.2
        searchGradientRectangle.layer.shadowColor = UIColor.black.cgColor
        searchGradientRectangle.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    private func createSearchTextField() {
        searchTextField = CustomTextField()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Type here",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
    }
    
    private func createJobsLabel() {
        jobsLabel = UILabel()
        jobsLabel.text = "Jobs"
        jobsLabel.font = UIFont(name: Fonts.extraBold, size: 36)
        jobsLabel.textColor = MainColors.darkBlue
        jobsLabel.textAlignment = .left
    }
    
    private func createJobsTableView() {
        jobsTableView = UITableView(frame: .zero, style: .grouped)
        jobsTableView.delegate = self
        jobsTableView.dataSource = self
        
        jobsTableView.rowHeight = CellDimensions.Y
        jobsTableView.separatorColor = .clear
        jobsTableView.backgroundColor = .clear
        jobsTableView.showsVerticalScrollIndicator = false
        
        jobsTableView.register(JobTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    private func addConstraints() {
        searchGradientRectangle.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.width.equalTo(view)
            $0.top.equalTo(view).offset(-1 * 50)
            $0.bottom.equalTo(view.snp.top).offset(gradientRectHeight)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).inset(elementInset)
            $0.bottom.equalTo(searchGradientRectangle.snp.bottom).offset(-1 * 20)
            $0.height.equalTo(textFieldHeight)
        }
        
        jobsLabel.snp.makeConstraints {
            $0.leading.equalTo(view).offset(elementInset)
            $0.top.equalTo(searchGradientRectangle.snp.bottom).offset(heightElementDistance)
        }
        
        jobsTableView.snp.makeConstraints {
            $0.top.equalTo(jobsLabel.snp.bottom).offset(heightElementDistance - 20)
            $0.width.equalTo(view)
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    //MARK: - Additional functions
    
}
