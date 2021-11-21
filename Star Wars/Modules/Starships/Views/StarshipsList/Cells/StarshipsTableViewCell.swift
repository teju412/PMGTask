//
//  StarshipsTableViewCell.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import UIKit

final class StarshipsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var length: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(cellVM: StarshipsTableViewCellViewModel) {
        self.name.text = cellVM.name
        self.length.text = cellVM.length
    }
}

struct StarshipsTableViewCellViewModel {
    let name: String
    let length: String
}
