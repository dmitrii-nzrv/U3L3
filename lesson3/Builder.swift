import UIKit

class Builder{
    
    static func createMainView() -> UIViewController{
        let view = ViewController()
        let presenter = ViewControllerPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
}
