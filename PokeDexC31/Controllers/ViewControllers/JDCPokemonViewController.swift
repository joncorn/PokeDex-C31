//
//  JDCPokemonViewController.swift
//  PokeDexC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class JDCPokemonViewController: UIViewController {
    
    // MARK: - Properties
    var pokemon: JDCPokemon? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let pokemon = pokemon else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.IDLabel.text = "\(pokemon.identifier)"
            self.abilitiesLabel.text = "\(pokemon.abilities.joined(separator: ", "))"
        }
    }
}

// MARK: - SearchBarDelegate
extension JDCPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        JDCPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
        }
    }
}
