//
//  FeedViewController.swift
//  netology-ui-2-navigation
//
//  Created by ake11a on 2022-10-21.
//

import UIKit

class FeedViewController: UIViewController {

    var accidentsPost = Post(title: "Accidents news")
    
    private lazy var post1Button: UIButton = {
        let button = UIButton()
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Post", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private lazy var post2Button: UIButton = {
        let button = UIButton()
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Post", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        return stackView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drawSelf()
    
    }
   
    private func drawSelf() {
        view.backgroundColor = .lightGray
        
        //setupPostButton()
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(post1Button)
        buttonStackView.addArrangedSubview(post2Button)
 
        
        let buttonStackCenterXConstraint = buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let buttonStackCenterYConstraint = buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let buttonStackLeadingConstraint = buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let buttonStackTrailingConstraint = buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let buttonStackHeightConstraint = buttonStackView.heightAnchor.constraint(equalToConstant: 110)
        
        NSLayoutConstraint.activate([
            buttonStackCenterXConstraint, buttonStackCenterYConstraint, buttonStackLeadingConstraint, buttonStackTrailingConstraint, buttonStackHeightConstraint
        ])
    }
    
//    private func setupPostButton() {
//
//        view.addSubview(postButton)
//
//        postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        postButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
//    }
//

    
    @objc private func postButtonAction() {
        let postViewController = PostViewController()
        
        postViewController.title = accidentsPost.title
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
