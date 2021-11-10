//
//  TextualTableViewCell.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import UIKit

class TextualTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "textual_cell"
    
    var propertyName: UILabel!
    var propertyValue: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        contentView.backgroundColor = .white
        propertyName.text = ""
        propertyValue.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        propertyName = UILabel()
        propertyName.translatesAutoresizingMaskIntoConstraints = false
        propertyName.font = UIFont.systemFont(ofSize: 19)
        propertyName.textAlignment = .left
        propertyName.textColor = .black
        propertyName.numberOfLines = 1
        propertyName.minimumScaleFactor = 0.5
        propertyName.adjustsFontSizeToFitWidth = true
        propertyName.sizeToFit()
        contentView.addSubview(propertyName)
        
        propertyValue = UILabel()
        propertyValue.translatesAutoresizingMaskIntoConstraints = false
        propertyValue.font = UIFont.systemFont(ofSize: 19)
        propertyValue.textAlignment = .right
        propertyValue.textColor = .black
        propertyValue.sizeToFit()
        contentView.addSubview(propertyValue)
        
        contentView.addConstraints([
            propertyName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            propertyName.trailingAnchor.constraint(equalTo: propertyValue.leadingAnchor, constant: 10.0),
            propertyName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            propertyName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
            propertyValue.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            propertyValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            propertyValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0)
        ])
        
        self.selectionStyle = .none
    }
    
    /// Setup cell values with username and points
    /// - Parameters:
    ///   - username: User username
    ///   - points: Points of the game
    func setup(item: DetailItem) {
        contentView.backgroundColor = .white
        switch item.type {
        case .stats:
            if let statItem = item as? PokemonStatModel {
                propertyName.text = statItem.statName.capitalized
                propertyValue.text = String(statItem.baseStat)
            }
        case .category:
            if let statItem = item as? PokemonTypeModel {
                propertyName.text = statItem.name.capitalized
                propertyValue.text = String(statItem.slot)
            }
        default:
            propertyName.text = ""
            propertyValue.text = ""
        }
    }
    
}
