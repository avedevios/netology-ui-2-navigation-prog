//
//  FeedViewController.swift
//  netology-ui-2-navigation
//
//  Created by ake11a on 2022-10-21.
//

import UIKit

class FeedViewController: UIViewController {

    var accidentsPost = Post(title: "Accidents news")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupPostButton()
    
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func setupPostButton() {
        
        view.addSubview(postButton)
        
        postButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var postButton: UIButton = {
        let postButton = UIButton()
        
        postButton.backgroundColor = .blue
        postButton.layer.cornerRadius = 12
        postButton.setTitle("Post", for: .normal)
        //postButton.setTitleColor(.lightGray, for: .normal)
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        postButton.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        return postButton
    }()
    
    @objc private func postButtonAction() {
        let postViewController = PostViewController()
        
        postViewController.title = accidentsPost.title
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
