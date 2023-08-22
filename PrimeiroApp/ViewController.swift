//
//  ViewController.swift
//  PrimeiroApp
//
//  Created by LEARN Academy on 7/13/23.
//

import UIKit

class ViewController: UIViewController {

	var nameLabel = UILabel()
	var profileImageView = UIImageView()
	var followButton = UIButton()
	var bioTextview = UITextView()
	var commentTextField = UITextField()
	
	var isFollowing = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white  //adicionar
		
		/* TITULO */
		nameLabel.text = "Henrique Lambertucci"
		nameLabel.textColor = .systemGreen
		nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false  //it's telling the project
//to use the constraints I want to set not theirs.
		view.addSubview(nameLabel)
		
		/* IMAGEM ABAIXO DO TITULO */
		profileImageView.image = UIImage(named: "hen")
		profileImageView.contentMode = .scaleAspectFill  // olhar print no slack e escolher qual quiser
		profileImageView.clipsToBounds = true  // any part that kind of spills over we just cut it off
		profileImageView.layer.cornerRadius = 5
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(profileImageView)
		
		/* BOTAO */
		followButton.setTitle("     Follow     ", for: .normal)
		followButton.setTitleColor(.systemGreen, for: .normal)
		followButton.layer.borderWidth = 1
		followButton.layer.borderColor = UIColor.systemGreen.cgColor
		followButton.layer.cornerRadius = 10
		followButton.translatesAutoresizingMaskIntoConstraints = false
		
		followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside) // touchUpInside means if you click inside the button it works.
		view.addSubview(followButton)
		
		/* TEXTO */
		bioTextview.text = "Henri is a native of Brazil, Full Stack Developer, with a Civil Engineering background and also an US Air Force veteran.Likes Anime, Manga, Netflix, anything Tech related, also going out to the movie theaters to immerse himself in cinematic experiences, going to the beach and parks to be connected to nature.In his essence, Henri is a blend of technical prowess, a lover of stories, and a soul who cherishes nature."
		bioTextview.textColor = .systemGreen
		bioTextview.font = .systemFont(ofSize: 20)
		bioTextview.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bioTextview)

		
		setupConstraints()
//	could type the constraints here but I wont, I will write a func to make it cleaner
		
		// Do any additional setup after loading the view.
	}

	func setupConstraints(){
//		Constraints for NameLabel
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
//		Constraints for ImageView
		NSLayoutConstraint.activate([
			profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
			profileImageView.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
			profileImageView.widthAnchor.constraint(equalToConstant: 200),
			profileImageView.heightAnchor.constraint(equalToConstant: 200)
		])
//		Constraints for Button
		NSLayoutConstraint.activate([
			followButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
			followButton.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
			followButton.widthAnchor.constraint(equalToConstant: 150),
			followButton.heightAnchor.constraint(equalToConstant: 50)
		])
//    Constraints for TextView
		NSLayoutConstraint.activate([
			bioTextview.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
			bioTextview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			bioTextview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			bioTextview.heightAnchor.constraint(equalToConstant: 200)
		])

	}
	
	@objc func followButtonTapped(){
		if !isFollowing {
			isFollowing = true
			followButton.setTitle("Following", for: .normal)
			//	follow
		}
		else {
			isFollowing = false
			followButton.setTitle("Follow", for: .normal)
			//	unfollow  :(
		}
	}
}

