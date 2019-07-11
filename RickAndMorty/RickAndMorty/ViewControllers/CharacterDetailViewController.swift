//
//  CastDetailViewController.swift
//  RickAndMorty
//
//  Created by Kalangutkar Ankita Vinod on 7/10/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

/// Character detail screen
class CharacterDetailViewController: UIViewController {
    
    @IBOutlet var castDetailTableView: CharacterDetailTableView!
    @IBOutlet weak var profileImageView: UIImageView!
    var characterModel: CharacterModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Constants.CharacterDetail.characterDetailTitle
        
        castDetailTableView.dataSourceValue = characterModel ?? CharacterModel()
        
        loadProfileImage()
    }
    
    /// Load profile image
    private func loadProfileImage() {
        if let profileUrlString = characterModel?.imageURL, let profileUrl = URL(string: profileUrlString) {
            profileImageView.load(url: profileUrl)
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
            profileImageView.clipsToBounds = true
        }
    }
    
    /// Insantiate the class
    ///
    /// - Returns: self
    class func instantiateFromStoryboard() -> CharacterDetailViewController {
        let storyboard = UIStoryboard.init(name: Constants.Storyboard.mainStoryboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! CharacterDetailViewController
    }

}
