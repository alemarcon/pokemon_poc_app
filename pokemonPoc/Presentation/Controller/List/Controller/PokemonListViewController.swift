//
//  PokemonListViewController.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import UIKit
import Swinject

class PokemonListViewController: BaseViewController {
    
    var viewModel: PokemonListViewModel?
    var pokemonTable: UITableView!
    
    init(viewModel: PokemonListViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildPokemonListUI()
        bindViewModel()
        viewModel?.loadPokemon()
    }
    
    fileprivate func buildPokemonListUI() {
        view.backgroundColor = .white
        
        pokemonTable = UITableView()
        pokemonTable.translatesAutoresizingMaskIntoConstraints = false
        pokemonTable.allowsMultipleSelection = false
        pokemonTable.dataSource = self
        pokemonTable.delegate = self
        pokemonTable.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.IDENTIFIER)
        view.addSubview(pokemonTable)
        
        view.addConstraints([
            pokemonTable.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            pokemonTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pokemonTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: pokemonTable.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    private func bindViewModel() {
        
        if let viewModel = viewModel {
            viewModel.status.bind(to: view) { [weak self] activity, _ in
                switch viewModel.status.value {
                case .none:
                    LOGD("Reload games table")
                case .pokemonLoading:
                    self?.showLoadingActivity()
                case .pokemonLoadingFail:
                    LOGE("Pokemon loading fails")
                    self?.hideLoadingActivity()
                case .pokemonLoadingSuccess:
                    self?.hideLoadingActivity()
                    self?.pokemonTable.reloadData()
                }
            }
        } else {
            LOGW("View model is ni")
        }
        
    }

}

extension PokemonListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pokemonList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.IDENTIFIER, for: indexPath) as? PokemonListTableViewCell {
            if let pokemon = viewModel?.pokemonList?[indexPath.row] {
                cell.selectionStyle = .none
                cell.setupCell(pokemon: pokemon)
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
    
}


extension PokemonListViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            viewModel?.loadMorePokemon()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let path = viewModel?.pokemonList?[indexPath.row].detailUrl {
            if let controller = Assembler.sharedAssembler.resolver.resolve(PokemonDetailViewController.self, argument: path) {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
