//
//  Created by Jake Lin on 12/14/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableViewController: UIViewController, ViewControllerDesignable {
  @IBInspectable public var hideNavigationBar: Bool = false
  
  // MARK: - Lifecylce
  public override func viewDidLoad() {
    super.viewDidLoad()
    confingHideNavigationBar()
  }
}
