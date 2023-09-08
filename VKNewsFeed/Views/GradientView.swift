//
//  GradientView.swift
//  VKNewsFeed
//
//  Created by Артур Байбиков on 08.09.2023.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame  = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
