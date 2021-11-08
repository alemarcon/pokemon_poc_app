//
//  PokemonListTableViewCell.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import UIKit
import SDWebImage

class PokemonListTableViewCell: UITableViewCell {

    static let IDENTIFIER = "pokemon_list_cell"
    
    var pokemonImage: UIImageView!
    var pokemonName: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        contentView.backgroundColor = .white
        pokemonImage.image = nil
        pokemonName.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        pokemonName = UILabel()
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.font = UIFont.systemFont(ofSize: 19)
        pokemonName.textAlignment = .left
        pokemonName.textColor = .black
        pokemonName.numberOfLines = 1
        pokemonName.minimumScaleFactor = 0.5
        pokemonName.adjustsFontSizeToFitWidth = true
        pokemonName.sizeToFit()
        contentView.addSubview(pokemonName)
        
        pokemonImage = UIImageView()
        pokemonImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pokemonImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonImage)
        
        
        contentView.addConstraints([
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            pokemonImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            pokemonImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
            pokemonName.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20.0),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            pokemonName.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor)
        ])
    }
    
    func setupCell(pokemon: PokemonItemModel) {
        pokemonName.text = pokemon.name.capitalized
        pokemonImage.sd_setImage(with: pokemon.getImageUrl(), completed: nil)
    }

}
