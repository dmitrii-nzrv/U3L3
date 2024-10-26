
import UIKit


protocol ViewControllerProtocol: AnyObject{
    var tableView: UITableView {get set}
    
}

class ViewController: UIViewController, ViewControllerProtocol {

    var presenter: ViewControllerPresenterProtocol!
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    private lazy var addBnt: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: view.frame.width - 100, y: view.frame.height - 100)
        $0.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return $0
    }(UIButton(primaryAction: action))
    
    
    private lazy var action: UIAction = UIAction { [weak self]_ in
        self?.presenter.sendReq()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(addBnt)
        
        //presenter.sendReq()
    }

    @objc func btnAction(){
        presenter.sendReq()
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = presenter.items[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    
}
