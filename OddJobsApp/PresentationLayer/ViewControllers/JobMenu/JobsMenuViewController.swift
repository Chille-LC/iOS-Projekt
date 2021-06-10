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
    private let gradientRectHeightMul: CGFloat = 0.15
    
    //MARK: - VC elements
    var coordinator: NavigationCoordinator! //Not private so we can use it in JobsMenuVC extension
    private var searchGradientRectangle: UIView!
    private var searchTextField: CustomTextField!
    private var jobsLabel: UILabel!
    private var jobsTableView: UITableView!
    private var gradient = CAGradientLayer()
    
    let model: [[Job]] = generateJobs()
    
    var landscapeConstraints: [Constraint] = []
    var portraitConstraints: [Constraint] = []
    
    //TableViewVars
    var storedOffsets = [Int: CGFloat]()
    
    //MARK: - Code
    convenience init(coordinator: NavigationCoordinator) {
        self.init()
        
        self.coordinator = coordinator
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        buildViews()
        addConstraints()
    }
    
    override func updateViewConstraints() {
            super.updateViewConstraints()
            updateConstraints()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
            view.setNeedsUpdateConstraints()
    }
    
    //MARK: - Building Views and Constraints
    private func buildViews() {
        view.backgroundColor = .white
        
        createSearchGradientRectangle()
        createSearchTextField()
        createJobsLabel()
        createJobsTableView()
        
        view.addSubview(jobsTableView)
        view.addSubview(searchGradientRectangle)
        view.addSubview(searchTextField)
        view.addSubview(jobsLabel)
    }
    
    private func createSearchGradientRectangle() {
        let height: CGFloat
        switch(traitCollection.verticalSizeClass, traitCollection.horizontalSizeClass) {
        case (.compact, .regular), (.compact, .compact): //Landscape
            height = UIScreen.main.bounds.width
        default:
            height = UIScreen.main.bounds.height
        }
        
        searchGradientRectangle = UIView(frame: CGRect(x: 0, y: 0, width: [UIScreen.main.bounds.width, UIScreen.main.bounds.height].min()!, height: height * gradientRectHeightMul + 50))
        
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
    
    private func updateConstraints() {
        switch(traitCollection.verticalSizeClass, traitCollection.horizontalSizeClass) {
        case (.compact, .regular), (.compact, .compact): //Landscape
            portraitConstraints.forEach{ $0.deactivate() }
            landscapeConstraints.forEach{ $0.activate() }
            jobsLabel.isHidden = true
        default:
            landscapeConstraints.forEach{ $0.deactivate() }
            portraitConstraints.forEach{ $0.activate() }
            jobsLabel.isHidden = false
        }
    }
    
    private func addConstraints() {
        var height: CGFloat
        var width: CGFloat
        
        switch(traitCollection.verticalSizeClass, traitCollection.horizontalSizeClass) {
        case (.compact, .regular), (.compact, .compact): //Landscape
            height = UIScreen.main.bounds.width
            width = UIScreen.main.bounds.height
        default:
            height = UIScreen.main.bounds.height
            width = UIScreen.main.bounds.width
        }
        
        portraitConstraints.append(contentsOf:
            searchGradientRectangle.snp.prepareConstraints {
                $0.centerX.equalTo(view)
                $0.width.equalTo(view)
                $0.top.equalTo(view).offset(-1 * 50)
                $0.bottom.equalTo(view.snp.top).offset(gradientRectHeightMul * height)
            })
        
        portraitConstraints.append(contentsOf:
            searchTextField.snp.prepareConstraints {
                $0.centerX.equalTo(view)
                $0.width.equalTo(view).inset(elementInset)
                $0.bottom.equalTo(searchGradientRectangle.snp.bottom).offset(-1 * 20)
                $0.height.equalTo(textFieldHeight)
            })
        
        portraitConstraints.append(contentsOf:
            jobsLabel.snp.prepareConstraints {
                $0.leading.equalTo(view).offset(elementInset)
                $0.top.equalTo(searchGradientRectangle.snp.bottom).offset(heightElementDistance)
            })
        
        portraitConstraints.append(contentsOf:
            jobsTableView.snp.prepareConstraints {
                $0.top.equalTo(jobsLabel.snp.bottom).offset(heightElementDistance - 20)
                $0.width.equalTo(view)
                $0.centerX.equalTo(view)
                $0.bottom.equalTo(view.snp.bottom)
            })
        
        
        
        landscapeConstraints.append(contentsOf:
            searchGradientRectangle.snp.prepareConstraints {
                $0.leading.equalTo(abs(width - height) / 2)
                $0.width.equalTo(width)
                $0.top.equalTo(view).offset(-1 * 50)
                $0.bottom.equalTo(view.snp.top).offset(gradientRectHeightMul * height)
            })
        
        landscapeConstraints.append(contentsOf:
            searchTextField.snp.prepareConstraints {
                $0.leading.equalTo(searchGradientRectangle.snp.leading).offset(elementInset)
                $0.trailing.equalTo(searchGradientRectangle.snp.trailing).offset(-1 * elementInset)
                $0.bottom.equalTo(searchGradientRectangle.snp.bottom).offset(-1 * 20)
                $0.height.equalTo(textFieldHeight)
            })
        
        landscapeConstraints.append(contentsOf:
            jobsTableView.snp.prepareConstraints {
                $0.top.equalTo(searchGradientRectangle.snp.bottom)
                $0.width.equalTo(view)
                $0.centerX.equalTo(view)
                $0.bottom.equalTo(view.snp.bottom)
            })
    }
    //MARK: - Additional functions
    
}
