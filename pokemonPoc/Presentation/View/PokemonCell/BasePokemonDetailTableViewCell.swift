//
//  BasePokemonDetailTableViewCell.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import UIKit

enum DetailCellType {
    case unknow
    case imageCell
    case statCell
    case categoryCell
}

class BasePokemonDetailTableViewCell: UITableViewCell {

    var cellType: DetailCellType = .unknow
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
