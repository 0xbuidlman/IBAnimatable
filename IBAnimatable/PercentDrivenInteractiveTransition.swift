//
//  Created by Jake Lin on 4/5/16.
//  Copyright © 2016 Jake Lin. All rights reserved.
//

import UIKit

// Super class for all interactive animators
public class PercentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition {
  internal(set) public var interacting = false
  
  // transitionType: Used to deteminate pop or dismiss
  let transitionType: TransitionType
  // interactiveGestureType: Used to deteminate gesture type (direction)
  let interactiveGestureType: InteractiveGestureType
  // viewController: the viewController will connect to the gestureRecognizer
  var viewController: UIViewController?
  // gestureRecognizer: the gesture recognizer to handle gesture
  var gestureRecognizer: UIGestureRecognizer?
  
  init(interactiveGestureType: InteractiveGestureType, transitionType: TransitionType) {
    self.interactiveGestureType = interactiveGestureType
    self.transitionType = transitionType
    super.init()
  }
  
  deinit {
    gestureRecognizer?.removeTarget(self, action: #selector(handleGesture(_:)))
  }
  
  func connectGestureRecognizer(viewController: UIViewController) {
    self.viewController = viewController
    let gestureRecognizerType = getGestureRecognizerType()
    gestureRecognizer = gestureRecognizerType.init(target: self, action: #selector(handleGesture(_:)))
    if let gestureRecognizer = gestureRecognizer {
      self.viewController?.view.addGestureRecognizer(gestureRecognizer)
    }
  }
  
  func getGestureRecognizerType() -> UIGestureRecognizer.Type {
    preconditionFailure("This method must be overridden")
  }
  
  func handleGesture(gestureRecognizer: UIGestureRecognizer) {
    preconditionFailure("This method must be overridden") 
  }
  
}
