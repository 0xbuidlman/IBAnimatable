//
//  TintDesignable.swift
//  IBAnimatableApp
//
//  Created by Jake Lin on 11/24/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

public protocol TintDesignable {
  /**
   tinted color
   */
  var tintedColor: UIColor { get set }
  
  /**
   Opacity in tinted view: from 0 to 1
   */
  var tintOpacity: Float { get set }
}

public extension TintDesignable where Self:UIView {
  public func configTintedColor() {
    if (tintedColor != UIColor.clearColor()
      && tintOpacity>0 && tintOpacity<=1) {
        let sublayer = CALayer()
        sublayer.backgroundColor = tintedColor.CGColor
        sublayer.opacity = tintOpacity
        sublayer.frame = frame
        self.layer.insertSublayer(sublayer, atIndex: 0)
    }
  }
}
