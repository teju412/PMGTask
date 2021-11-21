//
//  FilmsTableViewCell.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import UIKit

final class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(cellVM: FilmsTableViewCellViewModel) {
        self.title.text = cellVM.title
        self.releaseDate.text = cellVM.formatedReleaseDate
    }
}

struct FilmsTableViewCellViewModel {
    let title: String
    let releaseDate: String
    
    var formatedReleaseDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-dd"
        guard let date = dateFormater.date(from: releaseDate) else { return "" }
        dateFormater.dateFormat = "dd/MM/YYYY"
        return dateFormater.string(from: date)
    }
}
