//
//  StarshipDetailsViewController.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import UIKit

final class StarshipDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var costInCredits: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var maxAtmospheringSpeed: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var cargoCapacity: UILabel!
    @IBOutlet weak var consumables: UILabel!
    @IBOutlet weak var hyperdriveRating: UILabel!
    @IBOutlet weak var mgtl: UILabel!
    @IBOutlet weak var starshipClass: UILabel!
    
    var viewModel: IStarshipsViewModel
    
    init(viewModel: IStarshipsViewModel = StarshipsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "StarshipDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setup()
    }

    func setup() {
        guard let starship = viewModel.starshipDetails else { return }
        self.name.text = starship.name
        self.model.text = starship.model
        self.manufacturer.text = starship.manufacturer
        self.costInCredits.text = starship.costInCredits
        self.length.text = starship.length
        self.maxAtmospheringSpeed.text = starship.maxAtmospheringSpeed
        self.crew.text = starship.crew
        self.passengers.text = starship.passengers
        self.cargoCapacity.text = starship.cargoCapacity
        self.consumables.text = starship.consumables
        self.hyperdriveRating.text = starship.hyperdriveRating
        self.mgtl.text = starship.MGLT
        self.starshipClass.text = starship.starshipClass
    }

}
