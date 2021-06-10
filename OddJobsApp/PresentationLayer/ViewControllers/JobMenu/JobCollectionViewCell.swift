//
//  JobCollectionViewCell.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {
    private let titleFontSize: CGFloat = 20
    private let descriptionFontSize: CGFloat = 12
    private let priceFontSize: CGFloat = 20
    private let currencyFontSize: CGFloat = 13
    private let cellCornerRadius: CGFloat = 25
    
    private var jobTitle = UILabel()
    private var jobDescription = UILabel()
    private var jobPrice = UILabel()
    private var waveView = WaveView(frame: CGRect(x: 0, y: CellDimensions.Y * 2/3, width: CellDimensions.X, height: CellDimensions.Y))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = MainColors.secondaryGray
        layer.cornerRadius = cellCornerRadius
        layer.masksToBounds = true
        
        addSubview(waveView)
        addSubview(jobTitle)
        addSubview(jobDescription)
        addSubview(jobPrice)
        
        createTitle()
        createDescription()
        createPrice()
        
        setConstraints()
    }
    
    private func createTitle() {
        
        jobTitle.textColor = .white
        jobTitle.adjustsFontSizeToFitWidth = true
        jobTitle.font = UIFont(name: Fonts.extraBold, size: titleFontSize)
        jobTitle.textAlignment = .left
    }
    
    private func createDescription() {
        
        jobDescription.numberOfLines = 0
        jobDescription.lineBreakMode = .byWordWrapping
        jobDescription.textAlignment = .left
        jobDescription.textColor = .white
        jobDescription.font = UIFont(name: Fonts.semiBold, size: descriptionFontSize)
    }
    
    private func createPrice() {
        
        jobPrice.font = UIFont(name: Fonts.semiBold, size: currencyFontSize)
        jobPrice.textAlignment = .right
        jobPrice.textColor = .white
    }
    
    private func setConstraints() {
        jobTitle.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(22)
            $0.width.equalTo(self.snp.width).inset(16)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        jobDescription.snp.makeConstraints {
            $0.top.equalTo(jobTitle.snp.bottom).offset(22)
            $0.width.equalTo(self.snp.width).inset(16)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        jobPrice.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-1 * 15)
            $0.width.equalTo(self.snp.width).inset(16)
            $0.centerX.equalTo(self.snp.centerX)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(job: Job) {
        jobTitle.attributedText = NSAttributedString(string: job.title, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        jobDescription.text = job.description
        
        let amountText = NSMutableAttributedString.init(string: "\(job.price) $/h")
        amountText.setAttributes([NSAttributedString.Key.font: UIFont(name: Fonts.extraBold, size: priceFontSize) ?? UIFont.systemFont(ofSize: priceFontSize)], range: NSMakeRange(0, amountText.length - 4))
        jobPrice.attributedText = amountText
    }
}
