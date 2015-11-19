//
//  Created by Jake Lin on 11/18/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

public protocol CSSPaddingable {
  /**
    `padding-left`
  */
  var paddingLeft: CGFloat { get set }

  /**
    `padding-right`
  */
  var paddingRight: CGFloat { get set }

  /**
   `padding-left` and `padding-right`
 */
  var paddingSide: CGFloat { get set }
}

public extension CSSPaddingable where Self:UITextField {
  public func configPaddingLeft() {
    let padding = UIView(frame: CGRectMake(0, 0, paddingLeft, 0))
    leftViewMode = UITextFieldViewMode.Always
    leftView = padding
  }
  
  public func configPaddingRight() {
    let padding = UIView(frame: CGRectMake(0, 0, paddingRight, 0))
    rightViewMode = UITextFieldViewMode.Always
    rightView = padding
  }

  public func configPaddingSide() {
    let padding = UIView(frame: CGRectMake(0, 0, paddingSide, paddingSide))
    leftViewMode = UITextFieldViewMode.Always
    leftView = padding

    rightViewMode = UITextFieldViewMode.Always
    rightView = padding
  }
}
