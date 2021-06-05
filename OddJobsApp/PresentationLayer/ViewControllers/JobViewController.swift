//
//  JobViewController.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.06.2021..
//

import UIKit
import SnapKit

class JobViewController: UIViewController {

    //MARK: - Constants
    private let gradientRectangleHeightMul: CGFloat = 0.32
    private let fromTitleOffsetInScrollView: CGFloat = 20
    private let fromPrevOffsetInScrollView: CGFloat = 20
    
    //MARK: - VC elements
    private var job: Job!
    private var scrollView: UIScrollView!
    
    private var gradientRectangle: UIView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    private var memojiImage: UIImageView!
    
    private var nameSurnameLabel: UILabel!
    
    private var descriptionTitleLabel: UILabel!
    private var descriptionTextLabel: UILabel!

    private var phoneTitleLabel: UILabel!
    private var phoneTextLabel: UILabel!
    
    private var completedJobsTitleLabel: UILabel!
    private var completedJobsTextLabel: UILabel!
    
    private var priceLabel: UILabel!
    private var hireButton: UIButton!
    
    //MARK: - Code
    convenience init(for job: Job) {
        self.init()
        
        self.job = job
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        buildViews()
        addConstraints()
    }
    
    //MARK: - Building Views and Constraints
    private func buildViews() {
        view.backgroundColor = .white
        
        setNavigationBar()
        createGradientRectangleAndSubviews()
        createNameLabel()
        createScrollViewAndSubviews()
        createPriceLabel()
        createHireButton()
        
        view.addSubview(gradientRectangle)
        view.addSubview(nameSurnameLabel)
        view.addSubview(scrollView)
        view.addSubview(priceLabel)
        view.addSubview(hireButton)
    }
    
    private func setNavigationBar() {
        //MARK: Setting Navigation Bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .clear
        
        navigationController?.navigationBar.tintColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Jobs"
        backButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Fonts.semiBold, size: 17) ?? UIFont.systemFont(ofSize: 17)], for: .normal)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func createGradientRectangleAndSubviews() {
        gradientRectangle = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: gradientRectangleHeightMul * UIScreen.main.bounds.height + 50))
        let gradient = CAGradientLayer()
        
        gradient.frame = gradientRectangle.bounds
        gradient.colors = gradientColors
        gradient.cornerRadius = 45
        gradientRectangle.layer.addSublayer(gradient)

        //Corner radius
        gradientRectangle.layer.cornerRadius = 45
        gradientRectangle.layer.masksToBounds = false
        
        //Shadow
        gradientRectangle.layer.shadowRadius = 4.0
        gradientRectangle.layer.shadowOpacity = 0.2
        gradientRectangle.layer.shadowColor = UIColor.black.cgColor
        gradientRectangle.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        titleLabel = UILabel()
        titleLabel.text = job.title
        titleLabel.font = UIFont(name: Fonts.extraBold, size: 45)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        subtitleLabel = UILabel()
        subtitleLabel.text = job.category.rawValue
        subtitleLabel.font = UIFont(name: Fonts.semiBold, size: 18)
        subtitleLabel.textColor = .white
        subtitleLabel.textAlignment = .center
        
        memojiImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        memojiImage.image = UIImage(named: "memojiExample.png")
        memojiImage.contentMode = .scaleAspectFill
        memojiImage.layer.masksToBounds = true
        memojiImage.layer.cornerRadius = 50

        
        gradientRectangle.addSubview(titleLabel)
        gradientRectangle.addSubview(subtitleLabel)
        gradientRectangle.addSubview(memojiImage)
    }
    
    private func createNameLabel() {
        nameSurnameLabel = UILabel()
        nameSurnameLabel.text = "\(job.worker.name) \(job.worker.surname)"
        nameSurnameLabel.font = UIFont(name: Fonts.bold, size: 32)
        nameSurnameLabel.textAlignment = .center
        nameSurnameLabel.textColor = MainColors.darkBlue
    }
    
    private func createScrollViewAndSubviews() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        
        descriptionTitleLabel = UILabel()
        descriptionTitleLabel.text = "DESCRIPTION"
        descriptionTitleLabel.font = UIFont(name: Fonts.semiBold, size: 18)
        descriptionTitleLabel.textAlignment = .left
        descriptionTitleLabel.textColor = MainColors.darkBlue
        
        descriptionTextLabel = UILabel()
        descriptionTextLabel.text = job.description
        descriptionTextLabel.font = UIFont(name: Fonts.regular, size: 20)
        descriptionTextLabel.textAlignment = .left
        descriptionTextLabel.textColor = MainColors.darkBlue
        
        phoneTitleLabel = UILabel()
        phoneTitleLabel.text = "PHONE NUMBER"
        phoneTitleLabel.font = UIFont(name: Fonts.semiBold, size: 18)
        phoneTitleLabel.textAlignment = .left
        phoneTitleLabel.textColor = MainColors.darkBlue
        
        phoneTextLabel = UILabel()
        phoneTextLabel.text = job.worker.phone
        phoneTextLabel.font = UIFont(name: Fonts.regular, size: 20)
        phoneTextLabel.textAlignment = .left
        phoneTextLabel.textColor = MainColors.darkBlue
        
        completedJobsTitleLabel = UILabel()
        completedJobsTitleLabel.text = "COMPLETED JOBS"
        completedJobsTitleLabel.font = UIFont(name: Fonts.semiBold, size: 18)
        completedJobsTitleLabel.textAlignment = .left
        completedJobsTitleLabel.textColor = MainColors.darkBlue
        
        completedJobsTextLabel = UILabel()
        completedJobsTextLabel.text = String(job.worker.noOfJobs)
        completedJobsTextLabel.font = UIFont(name: Fonts.regular, size: 20)
        completedJobsTextLabel.textAlignment = .left
        completedJobsTextLabel.textColor = MainColors.darkBlue
        
        scrollView.contentSize = CGSize(width: view.frame.size.width - 2 * elementInset, height: 400) //promijeniti ovo 400 na dinamicnu vrijednost
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.addSubview(descriptionTitleLabel)
        scrollView.addSubview(descriptionTextLabel)
        scrollView.addSubview(phoneTitleLabel)
        scrollView.addSubview(phoneTextLabel)
        scrollView.addSubview(completedJobsTitleLabel)
        scrollView.addSubview(completedJobsTextLabel)
    }
    
    private func createPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = UIFont(name: Fonts.extraBold, size: 20)
        let amountText = NSMutableAttributedString.init(string: "\(job.price) $/h")
        amountText.setAttributes([NSAttributedString.Key.font: UIFont(name: Fonts.extraBold, size: 35) ?? UIFont.systemFont(ofSize: 35)], range: NSMakeRange(0, amountText.length - 4))
        priceLabel.attributedText = amountText
        
        priceLabel.textAlignment = .left
        priceLabel.textColor = MainColors.primaryOrange
    }
    
    private func createHireButton() {
        hireButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70))
        
        let gradient = CAGradientLayer()
        gradient.frame = hireButton.bounds
        gradient.colors = gradientColors
        hireButton.layer.addSublayer(gradient)
        hireButton.layer.cornerRadius = 25
        hireButton.layer.masksToBounds = true

        hireButton.setTitleColor(.white, for: .normal)
        hireButton.setAttributedTitle(NSAttributedString(string: "Hire me!", attributes: [.font: UIFont(name: Fonts.extraBold, size: 35) ?? UIFont.systemFont(ofSize: 35)]), for: .normal)
        
        hireButton.addTarget(self, action: #selector(callWorker), for: .touchUpInside)
    }

    private func addConstraints() {
        gradientRectangle.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.width.equalTo(view)
            $0.top.equalTo(view).offset(-1 * 50)
            $0.bottom.equalTo(view.snp.top).offset(gradientRectangleHeightMul * UIScreen.main.bounds.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(subtitleLabel).offset(-1 * 25)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(memojiImage.snp.top).offset(-1 * 0.05 * gradientRectangle.frame.height)
        }
        
        memojiImage.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(gradientRectangle.snp.bottom)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        
        nameSurnameLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(memojiImage.snp.bottom).offset(0.02 * view.frame.height)
        }
        
        scrollView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).inset(elementInset)
            $0.top.equalTo(nameSurnameLabel.snp.bottom).offset(0.05 * view.frame.height)
            $0.bottom.equalTo(hireButton.snp.top).offset(-1 * 10)
        }
        
        descriptionTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        descriptionTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(descriptionTitleLabel.snp.bottom).offset(fromTitleOffsetInScrollView)
        }
        
        phoneTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(descriptionTextLabel.snp.bottom).offset(fromPrevOffsetInScrollView)
        }
        
        phoneTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(phoneTitleLabel.snp.bottom).offset(fromTitleOffsetInScrollView)
        }
        
        completedJobsTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(phoneTextLabel.snp.bottom).offset(fromPrevOffsetInScrollView)
        }
        
        completedJobsTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(completedJobsTitleLabel.snp.bottom).offset(fromTitleOffsetInScrollView)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(view).offset(elementInset)
            $0.width.equalTo(110)
            $0.bottom.equalTo(view.snp.bottom).offset(-1 * 55)
        }
        
        hireButton.snp.makeConstraints {
            $0.leading.equalTo(priceLabel.snp.trailing).offset(elementInset)
            $0.trailing.equalTo(view.snp.trailing).offset(-1 * elementInset)
            $0.height.equalTo(70)
            $0.bottom.equalTo(view.snp.bottom).offset(-1 * 40)
        }
    }
    
    //MARK: - Additional functions
    @objc private func callWorker() {
        if let url = URL(string: "tel://\(job.worker.phone)"),
        UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
