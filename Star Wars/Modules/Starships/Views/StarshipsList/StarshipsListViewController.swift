//
//  StarshipsListViewController.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import UIKit

final class StarshipsListViewController: UIViewController {
    
    @IBOutlet weak var starshipsTableView: UITableView! {
        didSet {
            starshipsTableView.separatorColor = starshipsTableView.backgroundColor
            starshipsTableView.delegate = self
            starshipsTableView.dataSource = self
            starshipsTableView.register(UINib(nibName: "StarshipsTableViewCell", bundle: nil), forCellReuseIdentifier: "StarshipsTableViewCell")
        }
    }
    
    var viewModel: IStarshipsViewModel
    
    init(viewModel: IStarshipsViewModel = StarshipsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "StarshipsListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Starships"
        viewModel.loadStarships()
            .done { self.starshipsTableView.reloadData() }
            .catch { print($0.localizedDescription) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}

extension StarshipsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.starships.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipsTableViewCell", for: indexPath) as? StarshipsTableViewCell
        else { return UITableViewCell() }
        cell.configure(cellVM: viewModel.starshipsTableData[indexPath.row])
        return cell
    }
}

extension StarshipsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let starship = viewModel.starships[indexPath.row]
        viewModel.starshipDetails = starship
        let detailsPage = StarshipDetailsViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(detailsPage, animated: true)
    }
}
