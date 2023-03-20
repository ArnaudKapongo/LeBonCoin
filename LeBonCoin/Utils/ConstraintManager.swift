//
//  ConstraintManager.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import Foundation
import UIKit

class ConstraintManager {

    static let defaultLeftConstraint: CGFloat = m
    static let defaultRightConstraint: CGFloat = m
    static let defaultTopConstraint: CGFloat = xs
    static let defaultBottomConstraint: CGFloat = m

    static let xxxl: CGFloat = 48
    static let xxl: CGFloat = 40
    static let xl: CGFloat = 32
    static let l: CGFloat = 24
    static let m: CGFloat = 16
    static let s: CGFloat = 8
    static let xs: CGFloat = 4

    // MARK: - Contraintes de position relatives (par défaut)

    static func setDefaultLeftRightConstraints(view: UIView, parentView: UIView, greaterThanOrEqual: Bool = false) {
        setDefaultLeftConstraint(view: view, parentView: parentView, greaterThanOrEqual: greaterThanOrEqual)
        setDefaultRightConstraint(view: view, parentView: parentView, greaterThanOrEqual: greaterThanOrEqual)
    }

    static func setDefaultLeftConstraint(view: UIView, parentView: UIView, greaterThanOrEqual: Bool = false) {

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .greaterThanOrEqual : .equal)

        let leftConstraint = NSLayoutConstraint(item: view,
                                                attribute: .leading,
                                                relatedBy: relatedBy,
                                                toItem: parentView.safeAreaLayoutGuide,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: defaultLeftConstraint)

        leftConstraint.isActive = true
        parentView.addConstraint(leftConstraint)
    }

    static func setDefaultRightConstraint(view: UIView, parentView: UIView, greaterThanOrEqual: Bool = false) {

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .lessThanOrEqual : .equal)

        let rightConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .trailing,
                                                 relatedBy: relatedBy,
                                                 toItem: parentView.safeAreaLayoutGuide,
                                                 attribute: .trailing,
                                                 multiplier: 1.0,
                                                 constant: -defaultRightConstraint)

        rightConstraint.isActive = true
        parentView.addConstraint(rightConstraint)
    }

    static func setDefaultBottomConstraint(view: UIView, parentView: UIView, greaterThanOrEqual: Bool = false) {
        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .lessThanOrEqual : .equal)
        let bottomConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .bottom,
                                                  relatedBy: relatedBy,
                                                  toItem: parentView.safeAreaLayoutGuide,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: -defaultBottomConstraint)

        bottomConstraint.isActive = true
        parentView.addConstraint(bottomConstraint)
    }

    static func setDefaultTopConstraint(view: UIView, parentView: UIView, greaterThanOrEqual: Bool = false) {
        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .greaterThanOrEqual : .equal)
        let topConstraint = NSLayoutConstraint(item: view,
                                               attribute: .top,
                                               relatedBy: relatedBy,
                                               toItem: parentView.safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: defaultTopConstraint)

        topConstraint.isActive = true
        parentView.addConstraint(topConstraint)
    }

    // MARK: - Contraintes de position relatives (entre 2 éléments)

    static func setLeftConstraint(view: UIView, parentView: UIView, spacing: CGFloat, greaterThanOrEqual: Bool = false, respectSafeArea: Bool = true, useCenter: Bool = false) {

        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerX : .leading)

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .greaterThanOrEqual : .equal)

        let toItem: NSObject
        if let scrollView = parentView as? UIScrollView {
            toItem = scrollView.contentLayoutGuide
        } else {
            toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)
        }

        let leftConstraint = NSLayoutConstraint(item: view,
                                                attribute: attribute,
                                                relatedBy: relatedBy,
                                                toItem: toItem,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: spacing)

        leftConstraint.isActive = true
        parentView.addConstraint(leftConstraint)
    }

    static func setRightConstraint(view: UIView, parentView: UIView, spacing: CGFloat, greaterThanOrEqual: Bool = false, respectSafeArea: Bool = true, useCenter: Bool = false) {

        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerX : .trailing)

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .greaterThanOrEqual : .equal)

        let toItem: NSObject
        if let scrollView = parentView as? UIScrollView {
            toItem = scrollView.contentLayoutGuide
        } else {
            toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)
        }

        let rightConstraint = NSLayoutConstraint(item: view,
                                                 attribute: attribute,
                                                 relatedBy: relatedBy,
                                                 toItem: toItem,
                                                 attribute: .trailing,
                                                 multiplier: 1.0,
                                                 constant: -spacing)

        rightConstraint.isActive = true
        parentView.addConstraint(rightConstraint)
    }

    static func setTopConstraint(view: UIView, parentView: UIView, spacing: CGFloat, greaterThanOrEqual: Bool = false, respectSafeArea: Bool = true, useCenter: Bool = false, lowPriority: Bool = false) {

        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerY : .top)

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .greaterThanOrEqual : .equal)

        let toItem: NSObject
        if let scrollView = parentView as? UIScrollView {
            toItem = scrollView.contentLayoutGuide
        } else {
            toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)
        }

        let topConstraint = NSLayoutConstraint(item: view,
                                               attribute: attribute,
                                               relatedBy: relatedBy,
                                               toItem: toItem,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: spacing)

        if lowPriority == true {
            topConstraint.priority = UILayoutPriority.defaultLow
        }

        topConstraint.isActive = true
        parentView.addConstraint(topConstraint)
    }

    static func setBottomConstraint(view: UIView, parentView: UIView, spacing: CGFloat, lessThanOrEqual: Bool = false, respectSafeArea: Bool = true, useCenter: Bool = false) {

        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerY : .bottom)

        let relatedBy: NSLayoutConstraint.Relation = (lessThanOrEqual ? .lessThanOrEqual : .equal)

        let toItem: NSObject
        if let scrollView = parentView as? UIScrollView {
            toItem = scrollView.contentLayoutGuide
        } else {
            toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)
        }

        let bottomConstraint = NSLayoutConstraint(item: view,
                                                  attribute: attribute,
                                                  relatedBy: relatedBy,
                                                  toItem: toItem,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: -spacing)

        bottomConstraint.isActive = true
        parentView.addConstraint(bottomConstraint)
    }

    static func setVerticalConstraint(topView: UIView, bottomView: UIView, spacing: CGFloat, parentView: UIView, greaterThanOrEqual: Bool = false) {

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .lessThanOrEqual : .equal)

        let constraint = NSLayoutConstraint(item: topView,
                                            attribute: .bottom,
                                            relatedBy: relatedBy,
                                            toItem: bottomView,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: -spacing)

        constraint.isActive = true
        parentView.addConstraint(constraint)
    }

    static func setHorizontalConstraint(leftView: UIView, rightView: UIView, spacing: CGFloat, parentView: UIView, greaterThanOrEqual: Bool = false) {

        let relatedBy: NSLayoutConstraint.Relation = (greaterThanOrEqual ? .lessThanOrEqual : .equal)

        let constraint = NSLayoutConstraint(item: leftView,
                                            attribute: .trailing,
                                            relatedBy: relatedBy,
                                            toItem: rightView,
                                            attribute: .leading,
                                            multiplier: 1.0,
                                            constant: -spacing)

        constraint.isActive = true
        parentView.addConstraint(constraint)
    }

    static func alignViewsVertically(view1: UIView, view2: UIView, parentView: UIView, attribute: UIView.PositionConstraint = .centerY) {
        let constraint = NSLayoutConstraint(item: view1,
                                            attribute: attribute.attributeValue,
                                            relatedBy: .equal,
                                            toItem: view2,
                                            attribute: attribute.attributeValue,
                                            multiplier: 1.0,
                                            constant: 0.0)

        constraint.isActive = true
        parentView.addConstraint(constraint)
    }

    static func alignViewsHorizontally(view1: UIView, view2: UIView, parentView: UIView, attribute: UIView.PositionConstraint = .centerX) {
        let constraint = NSLayoutConstraint(item: view1,
                                            attribute: attribute.attributeValue,
                                            relatedBy: .equal,
                                            toItem: view2,
                                            attribute: attribute.attributeValue,
                                            multiplier: 1.0,
                                            constant: 0.0)

        constraint.isActive = true
        parentView.addConstraint(constraint)
    }

    // MARK: - Contraintes de dimension

    static func setRatioWidthHeightConstraint(view: UIView, ratio: CGFloat) {
        let ratioConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .height,
                                                 multiplier: ratio,
                                                 constant: 0)

        ratioConstraint.isActive = true
        view.addConstraint(ratioConstraint)
    }

    static func setHeightConstraint(view: UIView, height: CGFloat) {
        view.removeConstraintAttachedToAttribute(.height)

        let heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height)

        heightConstraint.isActive = true
        view.addConstraint(heightConstraint)
    }

    static func setWidthConstraint(view: UIView, width: CGFloat) {
        view.removeConstraintAttachedToAttribute(.width)

        let widthConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: width)

        widthConstraint.isActive = true
        view.addConstraint(widthConstraint)
    }

    static func setWidthConstraintPercent(view: UIView, parentView: UIView, percent: CGFloat, respectSafeArea: Bool = true, lessThanOrEqual: Bool = false) {
        let toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)

        let relatedBy: NSLayoutConstraint.Relation = (lessThanOrEqual ? .lessThanOrEqual : .equal)

        let widthConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .width,
                                                 relatedBy: relatedBy,
                                                 toItem: toItem,
                                                 attribute: .width,
                                                 multiplier: percent,
                                                 constant: 0)

        widthConstraint.isActive = true
        parentView.addConstraint(widthConstraint)
    }

    static func setHeightConstraintPercent(view: UIView, parentView: UIView, percent: CGFloat, respectSafeArea: Bool = true, lessThanOrEqual: Bool = false) {
        let toItem = (respectSafeArea ? parentView.safeAreaLayoutGuide : parentView)

        let relatedBy: NSLayoutConstraint.Relation = (lessThanOrEqual ? .lessThanOrEqual : .equal)

        let heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: relatedBy,
                                                  toItem: toItem,
                                                  attribute: .height,
                                                  multiplier: percent,
                                                  constant: 0)

        heightConstraint.isActive = true
        parentView.addConstraint(heightConstraint)
    }

    static func setEqualWidth(view1: UIView, view2: UIView, parentView: UIView) {
        let widthConstraint = NSLayoutConstraint(item: view1,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: view2,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 0)

        widthConstraint.isActive = true
        parentView.addConstraint(widthConstraint)
    }

    static func setEqualHeight(view1: UIView, view2: UIView, parentView: UIView) {
        let heightConstraint = NSLayoutConstraint(item: view1,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: view2,
                                                  attribute: .height,
                                                  multiplier: 1.0,
                                                  constant: 0)

        heightConstraint.isActive = true
        parentView.addConstraint(heightConstraint)
    }

    // MARK: - Contraintes de position en % du parent

    static func centerHorizontally(view: UIView, parentView: UIView) {
        let centerConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .centerX,
                                                  relatedBy: .equal,
                                                  toItem: parentView,
                                                  attribute: .centerX,
                                                  multiplier: 1.0,
                                                  constant: 0)

        centerConstraint.isActive = true
        parentView.addConstraint(centerConstraint)
    }

    static func centerVertically(view: UIView, parentView: UIView) {
        let centerConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .centerY,
                                                  relatedBy: .equal,
                                                  toItem: parentView,
                                                  attribute: .centerY,
                                                  multiplier: 1.0,
                                                  constant: 0)

        centerConstraint.isActive = true
        parentView.addConstraint(centerConstraint)
    }

    static func setYPositionPercent(view: UIView, parentView: UIView, percent: CGFloat, useCenter: Bool = false) {
        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerY : .top)

        let positionConstraint = NSLayoutConstraint(item: view,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: parentView,
                                                    attribute: .bottom,
                                                    multiplier: percent,
                                                    constant: 0)

        positionConstraint.isActive = true
        parentView.addConstraint(positionConstraint)
    }

    static func setXPositionPercent(view: UIView, parentView: UIView, percent: CGFloat, useCenter: Bool = false) {
        let attribute: NSLayoutConstraint.Attribute = (useCenter == true ? .centerX : .leading)

        let positionConstraint = NSLayoutConstraint(item: view,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: parentView,
                                                    attribute: .trailing,
                                                    multiplier: percent,
                                                    constant: 0)

        positionConstraint.isActive = true
        parentView.addConstraint(positionConstraint)
    }

    static func setRelativePositionPercent(view: UIView, parentView: UIView, percent: CGFloat, attribute: UIView.PositionConstraint) {
        let targetAttribute: NSLayoutConstraint.Attribute

        switch attribute {
            case .leading, .trailing, .centerX:
                targetAttribute = .trailing
            case .top, .bottom, .centerY:
                targetAttribute = .bottom
        }

        let positionConstraint = NSLayoutConstraint(item: view,
                                                    attribute: attribute.attributeValue,
                                                    relatedBy: .equal,
                                                    toItem: parentView,
                                                    attribute: targetAttribute,
                                                    multiplier: percent,
                                                    constant: 0)

        positionConstraint.isActive = true
        parentView.addConstraint(positionConstraint)
    }
}
