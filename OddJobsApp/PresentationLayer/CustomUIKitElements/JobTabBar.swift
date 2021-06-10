//
//  JobTabBar.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//
import UIKit

public final class JobTabBar: UITabBar {

    private var shapeLayer: CALayer?
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
    let shpLayer = CAShapeLayer()
    
    override public func draw(_ rect: CGRect) {
        addBlurAndShape()
    }
    
    private func addBlurAndShape() {
        shpLayer.path = createPath()
        blurView.layer.mask = shpLayer

        blurView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
          blurView.topAnchor.constraint(equalTo: self.topAnchor),
          blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
          blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
          blurView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func createPath() -> CGPath {
        let corner: CGFloat = UIScreen.main.bounds.height * 0.0237
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: corner * 2, y: frame.height - corner))
        path.addQuadCurve(to: CGPoint(x: corner, y: frame.height - 2 * corner), controlPoint: CGPoint(x: corner, y: frame.height - corner))
        path.addLine(to: CGPoint(x: corner, y: corner))
        path.addQuadCurve(to: CGPoint(x: corner * 2, y: 0), controlPoint: CGPoint(x: corner, y: 0))
        path.addLine(to: CGPoint(x: frame.width - 2 * corner, y: 0))
        path.addQuadCurve(to: CGPoint(x: frame.width - corner, y: corner), controlPoint: CGPoint(x: frame.width - corner, y: 0))
        path.addLine(to: CGPoint(x: frame.width - corner, y: frame.height - 2 * corner))
        path.addQuadCurve(to: CGPoint(x: frame.width - 2 * corner, y: frame.height - corner), controlPoint: CGPoint(x: frame.width - corner, y: frame.height - corner))
        path.close()
        
        return path.cgPath
    }
}

