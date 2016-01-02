//
//  Created by Jake Lin on 12/8/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

public protocol SideImageDesignable {
  /**
   * The left image
   */
  var leftImage: UIImage? { get set }
  
  /**
   * Left padding of the left image, default value is 0
   */
  var leftImageLeftPadding: CGFloat { get set }
  
  /**
   * Right padding of the left image, default value is 0
   */
  var leftImageRightPadding: CGFloat { get set }
  
  /**
   * Top padding of the left image, default value is CGFloat.NaN
   */
  var leftImageTopPadding: CGFloat { get set }
}

public extension SideImageDesignable where Self: UITextField {
  public func configLeftImage() {
    guard let wrappedLeftImage = leftImage else {
      return
    }
    
    let imageView = UIImageView(image: wrappedLeftImage)
    
    // If does not specify `leftImageTopPadding`, then center it in the middle
    if leftImageTopPadding.isNaN {
      imageView.frame.origin = CGPointMake(leftImageLeftPadding, (bounds.height - imageView.bounds.height)/2)
    }
    else {
      imageView.frame.origin = CGPointMake(leftImageLeftPadding, leftImageTopPadding)
    }
    
    let padding = leftImageLeftPadding + imageView.bounds.size.width + leftImageRightPadding
    let sideView = UIView(frame: CGRectMake(0, 0, padding, bounds.height))
    sideView.addSubview(imageView)
    
    leftViewMode = .Always
    leftView = sideView
  }
  
}

