
import Foundation


protocol ViewControllerPresenterProtocol: AnyObject{
    var items: [Article] { get set }
    func sendReq()
    
}

class ViewControllerPresenter: ViewControllerPresenterProtocol{
    weak var view: ViewControllerProtocol?
    private let manager = NetworkManager()
    
    var items: [Article] = []
    
    init(view: ViewControllerProtocol?) {
        self.view = view
    }
    
    func sendReq(){
        manager.getNews { [weak self] art in
            self?.items = art
            self?.view?.tableView.reloadData()
        }
    }
    
    
    
}
