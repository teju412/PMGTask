//
//  FilmsListViewController.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import UIKit

final class FilmsListViewController: UIViewController {
    
    @IBOutlet weak var filmsTableView: UITableView! {
        didSet {
            filmsTableView.separatorColor = filmsTableView.backgroundColor
            filmsTableView.delegate = self
            filmsTableView.dataSource = self
            filmsTableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmsTableViewCell")
        }
    }
    
    var viewModel: IFilmsViewModel
    
    init(viewModel: IFilmsViewModel = FilmsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "FilmsListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Films"
        viewModel.loadFilms()
            .done { self.filmsTableView.reloadData() }
            .catch { print($0.localizedDescription) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }


}

extension FilmsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsTableViewCell", for: indexPath) as? FilmsTableViewCell
        else { return UITableViewCell() }
        cell.configure(cellVM: viewModel.filmsTableData[indexPath.row])
        return cell
    }
}

extension FilmsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = viewModel.films[indexPath.row]
        viewModel.filmDetails = film
        let detailsPage = FilmDetailsViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(detailsPage, animated: true)
    }
}
