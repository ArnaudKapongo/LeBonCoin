//
//  UIViewExtension.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import UIKit

extension UIView {
    
    public enum DimensionConstraint {
        case width
        case height
        
        public var attributeValue: NSLayoutConstraint.Attribute {
            switch self {
            case .width:
                return .width
            case .height:
                return .height
                
            }
        }
    }
    
    public func removeConstraintAttachedToAttribute(_ attribute: UIView.DimensionConstraint) {
        let constraints = self.constraints.filter { constraint in
            return constraint.firstAttribute == attribute.attributeValue || constraint.secondAttribute == attribute.attributeValue
        }
        
        for constraint in constraints {
            constraint.isActive = false
            self.removeConstraint(constraint)
        }
    }
    
    public enum PositionConstraint {
        case top
        case bottom
        case leading
        case trailing
        case centerX
        case centerY
        
        public var attributeValue: NSLayoutConstraint.Attribute {
            switch self {
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            case .centerX:
                return .centerX
            case .centerY:
                return .centerY
            }
        }
    }
}
