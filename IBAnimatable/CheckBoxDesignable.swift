//
//  Created by Jake Lin on 12/20/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

public protocol CheckBoxDesignable {
  var checked: Bool { get set }
  var checkedImage: UIImage? { get set }
  var uncheckedImage: UIImage? { get set }
}

public extension CheckBoxDesignable where Self: UIButton {
  public func configCheckBoxChecked() {
    selected = checked
  }
  
  public func configCheckBoxCheckedImage() {
    setBackgroundImage(checkedImage, forState: .Selected)
    setBackgroundImage(checkedImage, forState: [.Selected, .Highlighted])
  }
  
  public func configCheckBoxUncheckedImage() {
    setBackgroundImage(uncheckedImage, forState: .Normal)
  }
}
