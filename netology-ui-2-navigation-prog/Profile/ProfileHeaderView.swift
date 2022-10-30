//
//  ProfileHeaderView.swift
//  netology-ui-2-navigation-prog
//
//  Created by ake11a on 2022-10-24.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFiledIsVisible: Bool, completion: @escaping () -> Void)
}

final class ProfileHeaderView: UIView {
    
    weak var delegate: ProfileHeaderViewProtocol?
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
      
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "Cat")
        //imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        
        return label
    }()
    
    private var statusText = "Waiting for something..."
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
     
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = statusText
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.text = statusText
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
  
        button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)

        return button
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 20

        return stackView
    }()
    
    private var buttonTopConstraint: NSLayoutConstraint?
    
    let statusSize = 200.00
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func drawSelf() {

        backgroundColor = .gray
        
        //let avatarSize = 100.0
        avatarImageView.layer.cornerRadius = 100 / 2
        
        statusTextField.isHidden = true
        
        self.addSubview(infoStackView)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        infoStackView.addArrangedSubview(avatarImageView)
        infoStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(fullNameLabel)
        labelStackView.addArrangedSubview(statusLabel)
    
        let topConstraint = infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingConstraint = infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let imageAspectRatio = avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.0)
        
        //let imageTopConstraint = avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        //let imageHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize)
        //let imageWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize)
        
        buttonTopConstraint = setStatusButton.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16)
        buttonTopConstraint?.priority = UILayoutPriority(999)
        
        let buttonLeadingConstraint = setStatusButton.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor)
        let buttonTrailingConstraint = setStatusButton.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor)
        let buttonBottomConstraint = setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        let buttonHeightConstraint = setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint,
            imageAspectRatio,
            buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonBottomConstraint, buttonHeightConstraint
        ].compactMap({ $0 }))
    }
    
    @objc private func statusTextChanged() {

        if let inputText = statusTextField.text {
            if inputText != "" {
                statusText = inputText
            }
        }
    }
    
    @objc private func didTapStatusButton() {
        
        if statusTextField.isHidden {
            self.addSubview(statusTextField)
            
            let textFieldTopConstraint = statusTextField.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16)
            let textFieldLeadingConstraint = statusTextField.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor)
            let textFieldTrailingConstraint = statusTextField.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor)
            let textFieldHeightConstraint = statusTextField.heightAnchor.constraint(equalToConstant: 40)
            
            buttonTopConstraint = setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16)
            
            NSLayoutConstraint.activate([
                textFieldTopConstraint, textFieldLeadingConstraint, textFieldTrailingConstraint, textFieldHeightConstraint,
                buttonTopConstraint
            ].compactMap({ $0 }))
        } else {
            statusTextField.removeFromSuperview()
            
        }
        
        self.delegate?.didTapStatusButton (textFiledIsVisible: self.statusTextField.isHidden) { [weak self] in
           
            self?.statusTextField.isHidden.toggle()
            self?.statusLabel.text = self?.statusText
            print(self?.statusLabel.text as Any)
        }
    }
}
