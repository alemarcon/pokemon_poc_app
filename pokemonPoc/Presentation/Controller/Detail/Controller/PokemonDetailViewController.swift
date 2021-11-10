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
    
    private let SECTION_COUNT = 3
    private let IMAGE_SECTION = 0
    private let STATS_SECTION = 1
    private let CATEGORY_SECTION = 2
    
    init(viewModel: PokemonDetailViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { transition in
            LOGD("Transitions in progress")
        } completion: { context in
            if( context.percentComplete == 0.0 ) {
                self.pokemonDataTable.reloadData()
            }
        }

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
        pokemonDataTable.showsVerticalScrollIndicator = false
        pokemonDataTable.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.IDENTIFIER)
        pokemonDataTable.register(TextualTableViewCell.self, forCellReuseIdentifier: TextualTableViewCell.IDENTIFIER)
        view.addSubview(pokemonDataTable)
        
        view.addConstraints([
            pokemonName.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            pokemonDataTable.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 15),
            pokemonDataTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor), //constraint(equalTo: view.leadingAnchor, constant: 0),
            pokemonDataTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),//.constraint(equalTo: view.trailingAnchor, constant: 0),
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
                    self?.showCancelAlert(title: NSLocalizedString(Localized.error_title.rawValue, comment: ""), message: viewModel.errorMessage ?? "")
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
        switch section {
        case IMAGE_SECTION:
            return viewModel?.detail?.images != nil ? 1 : 0
        case STATS_SECTION:
            return viewModel?.detail?.stats.count ?? 0
        case CATEGORY_SECTION:
            return viewModel?.detail?.category.count ?? 0
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel == nil ? 0 : SECTION_COUNT
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case IMAGE_SECTION:
            return NSLocalizedString(Localized.image.rawValue, comment: "")
        case STATS_SECTION:
            return NSLocalizedString(Localized.stats.rawValue, comment: "")
        case CATEGORY_SECTION:
            return NSLocalizedString(Localized.cat.rawValue, comment: "")
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case IMAGE_SECTION:
            if let items = viewModel?.detail?.images {
                guard let currentCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.IDENTIFIER, for: indexPath) as? ImageTableViewCell else {
                    return UITableViewCell()
                }
                currentCell.setupCell(images: items)
                return currentCell
            } else {
                return UITableViewCell()
            }
        case STATS_SECTION:
            if let item = viewModel?.detail?.stats[indexPath.row] {
                if( item.type == .stats ) {
                    guard let currentCell = tableView.dequeueReusableCell(withIdentifier: TextualTableViewCell.IDENTIFIER, for: indexPath) as? TextualTableViewCell else {
                        return UITableViewCell()
                    }
                    currentCell.setup(item: item)
                    return currentCell
                } else {
                    return UITableViewCell()
                }
            } else {
                return UITableViewCell()
            }
        case CATEGORY_SECTION:
            if let item = viewModel?.detail?.category[indexPath.row] {
                if( item.type == .category ) {
                    guard let currentCell = tableView.dequeueReusableCell(withIdentifier: TextualTableViewCell.IDENTIFIER, for: indexPath) as? TextualTableViewCell else {
                        return UITableViewCell()
                    }
                    currentCell.setup(item: item)
                    return currentCell
                } else {
                    return UITableViewCell()
                }
            } else {
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
}
