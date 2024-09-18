//
//
//
//  Created by Sahana  Rao on 03/09/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftUIInPractice: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
            
        }
    }
}

extension UINavigationController : UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
     
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
 
