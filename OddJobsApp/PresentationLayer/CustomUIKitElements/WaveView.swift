//
//  WaveView.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import UIKit

class WaveView: UIView {
    private var path1: UIBezierPath!
    private var path2: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        animateShape()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func complexShapeGenerator() {
        let beginningRandom = CGFloat.random(in: 10...40)
        let endingRandom = CGFloat.random(in: 10...30)
        let randomNumber1 = CGFloat.random(in: 0...50)
        let controlPointRandomNumber1: CGFloat
        let randomNumber2 = CGFloat.random(in: 0...50)
        let controlPointRandomNumber2: CGFloat
        
        let op = Int.random(in: 0...1)
        switch op {
            case 0:
                controlPointRandomNumber1 = randomNumber1
                controlPointRandomNumber2 = -1 * randomNumber2
            default: //1 ili vise
                controlPointRandomNumber1 = -1 * randomNumber1
                controlPointRandomNumber2 = randomNumber2
        }
        
        path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0.0, y: beginningRandom))
        path1.addCurve(to: CGPoint(x: frame.size.width, y: endingRandom),
                       controlPoint1: CGPoint(x: frame.size.width / 2 - 10, y: path1.currentPoint.y + controlPointRandomNumber1),
                       controlPoint2: CGPoint(x: frame.size.width / 2 + 10, y: path1.currentPoint.y + controlPointRandomNumber2))
        path1.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path1.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path1.close()
        
        path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0.0, y: 50 - beginningRandom))
        path2.addCurve(to: CGPoint(x: frame.size.width, y: 50 - endingRandom),
                       controlPoint1: CGPoint(x: frame.size.width / 2 - 10, y: path1.currentPoint.y - controlPointRandomNumber1),
                       controlPoint2: CGPoint(x: frame.size.width / 2 + 10, y: path1.currentPoint.y - controlPointRandomNumber2))
        path2.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path2.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path2.close()
    }
    
    
    private func animateShape() {
        complexShapeGenerator()
        
        let basicAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        basicAnimation.fromValue = path1.cgPath
        basicAnimation.toValue = path2.cgPath
        basicAnimation.beginTime = 0.0
        basicAnimation.duration = 2.5
        basicAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        let drawingLayer = CAShapeLayer()
        drawingLayer.path = path1.cgPath
        drawingLayer.fillColor = MainColors.primaryOrange.cgColor

        drawingLayer.add(basicAnimation, forKey: "wave")
        
        layer.addSublayer(drawingLayer)
    }
}
