//
//  ProfileViewController.swift
//  netology-ui-2-navigation-prog
//
//  Created by ake11a on 2022-10-22.
//

import UIKit

class ProfileViewController: UIViewController {
   
    private lazy var newButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .blue
        button.setTitle("New button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
  
        //button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)

        return button
    }()
    
    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
                                 
    private var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drawSelf()
        setupNavigationBar()
        setupView()
    }
    
    private func drawSelf() {
        view.addSubview(newButton)
        
        let buttonLeadingConstraint = newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let buttonTrailingConstraint = newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let buttonBottomConstraint = newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let buttonHeightConstraint = newButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            buttonLeadingConstraint, buttonTrailingConstraint, buttonBottomConstraint, buttonHeightConstraint
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {

        view.backgroundColor = .lightGray
        
        view.addSubview(headerView)
        
        let topConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        heightConstraint = headerView.heightAnchor.constraint(equalToConstant: 220)
        //let bottomConstraint = headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ].compactMap({ $0 }))
    }

    override func viewWillLayoutSubviews() {
        headerView.frame = view.frame
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFiledIsVisible: Bool, completion: @escaping () -> Void){
        heightConstraint?.constant = textFiledIsVisible ? 276 : 220
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}

