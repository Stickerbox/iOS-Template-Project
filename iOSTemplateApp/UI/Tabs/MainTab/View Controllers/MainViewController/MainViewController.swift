//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasMainViewModel
    var dependencies: HasMainViewModel!
    
    var viewModel: MainViewModelConformable!
    var finishedBlock: (() -> Void)?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindView()
    }
    
    private func bindView() {
        
        viewModel.progressText.observe { [weak self] in self?.progressLabel.text = $0 }
        viewModel.users.observe { [weak self] in self?.tableView.reloadData() }
    }

}

// MARK: UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID) as! MainTableViewCell
        cell.populate(from: viewModel.users.value?[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
}

// MARK: IBAction
extension MainViewController {
    
    @IBAction func performRequest() {
        viewModel.getUser()
    }
    
    @IBAction func getBadUsers() {
        viewModel.getBadUsers()
    }
    
    @IBAction func segue() {
        finishedBlock?()
    }
}
