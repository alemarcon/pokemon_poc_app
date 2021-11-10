//
//  PokemonDetailViewController.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import UIKit

class PokemonDetailViewController: BaseViewController {
    
    var pokemonName: UILabel!
    var pokemonDataTable: UITableView!
    var viewModel: PokemonDetailViewModel?
    
    init(viewModel: PokemonDetailViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildPokemonDetailUI()
        bindViewModel()
        viewModel?.loadPokemonDetail()
    }

    fileprivate func buildPokemonDetailUI() {
        view.backgroundColor = .white
        
        pokemonName = UILabel()
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.text = ""
        pokemonName.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        pokemonName.textAlignment = .center
        pokemonName.textColor = .black
        pokemonName.numberOfLines = 1
        pokemonName.sizeToFit()
        view.addSubview(pokemonName)
        
        pokemonDataTable = UITableView()
        pokemonDataTable.translatesAutoresizingMaskIntoConstraints = false
        pokemonDataTable.allowsMultipleSelection = false
        pokemonDataTable.dataSource = self
        pokemonDataTable.rowHeight = UITableView.automaticDimension
        pokemonDataTable.estimatedRowHeight = 44.0
        pokemonDataTable.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.IDENTIFIER)
        view.addSubview(pokemonDataTable)

        view.addConstraints([
            pokemonName.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            pokemonDataTable.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 15),
            pokemonDataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pokemonDataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: pokemonDataTable.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    private func bindViewModel() {
        
        if let viewModel = viewModel {
            viewModel.status.bind(to: view) { [weak self] activity, _ in
                switch viewModel.status.value {
                case .none:
                    LOGD("None")
                case .pokemonDetailLoading:
                    self?.showLoadingActivity()
                case .pokemonDetailLoadingFail:
                    LOGE("Pokemon loading fails")
                    self?.hideLoadingActivity()
                case .pokemonDetailLoadingSuccess:
                    LOGD("Loading succeded.")
                    self?.hideLoadingActivity()
                    self?.updateUIData()
                }
            }
        } else {
            LOGW("View model is ni")
        }
    }
    
    func updateUIData() {
        LOGD("Update UI")
        pokemonName.text = viewModel?.getPokemonName() ?? ""
        pokemonDataTable.reloadData()
    }
}

extension PokemonDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.detail?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = viewModel?.detail?.items[indexPath.row] {
            switch item.type {
            case .unknow:
                return UITableViewCell()
            case .image:
                guard let currentCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.IDENTIFIER, for: indexPath) as? ImageTableViewCell else {
                    return UITableViewCell()
                }
                currentCell.setupCell(images: item as! PokemonImageModel)
                return currentCell
            case .stats:
                return UITableViewCell()
            case .category:
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
    
}
