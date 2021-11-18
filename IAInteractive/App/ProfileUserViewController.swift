//
//  ProfileUserViewController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

enum PersonalInformationSections: CaseIterable
{
    case avatar, firstName, lastName, email, save
    
    static func numberOfSections() -> Int
    {
        return self.allCases.count
    }
    
    static func getSection(_ section: Int) -> PersonalInformationSections
    {
        return self.allCases[section]
    }
    
}

class ProfileUserViewController: BaseViewController {
    
    lazy var tableViewDatos: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: Constants.IdForCell.genericCell)
        tableView.register(AvatarCell.self, forCellReuseIdentifier: Constants.IdForCell.AvatarCell)
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = true
        return tableView
    }()
    
    
    lazy var firstNameTextField: UITextField = {
        let textField = CustomTextField.getTextField(withPlaceholder: Constants.Strings.firstName)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.returnKeyType = .next
        textField.text = "John"
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = CustomTextField.getTextField(withPlaceholder: Constants.Strings.lastName)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.returnKeyType = .done
        textField.text = "Doe"
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = CustomTextField.getTextField(withPlaceholder: Constants.Strings.email)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        textField.textColor = .lightGray
        textField.text = "johndoe@mail.com"
        return textField
    }()
    
    
    lazy var updateButton: UIButton = {
        let button = BaseButton.standardButton(withTitle: Constants.Strings.save)
        button.addTarget(self, action: #selector(updateData), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mercury
        self.title = "Información Personal"
        
        let cerrar = UIBarButtonItem(title: Constants.Strings.cerrar, style: .plain, target: self, action: #selector(self.close))
        self.navigationItem.rightBarButtonItem = cerrar
        
        self.setUpTableView()
        
    }
    
    fileprivate func setUpTableView() {
        mainView.addSubview(tableViewDatos)
        NSLayoutConstraint.activate([
            tableViewDatos.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableViewDatos.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            tableViewDatos.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableViewDatos.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableViewDatos.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableViewDatos.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        tableViewDatos.centerViewIn(superView: mainView)
    }
    
    
    func requestToUpdateUsername() {
        let params: [String : Any] = ["firstName" : firstNameTextField.text!,
                                      "lastName" : lastNameTextField.text!,
                                      "email" : emailTextField.text!] as [String : Any]
        print(" params ", params)
    } // [END] requestToUpdateUsername
    
    
    @objc func updateData() {
        if firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty {
            Alert.showIncompleteFormAlert(on: self)
        }
        else{
            // requestToUpdateUsername
            requestToUpdateUsername()
        }
    }
    
    
}

extension ProfileUserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return PersonalInformationSections.numberOfSections()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch PersonalInformationSections.getSection(indexPath.section) {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IdForCell.AvatarCell, for: indexPath)
            if let cell = cell as? AvatarCell {
                cell.setUpView()
                return cell
            }
        case .firstName:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IdForCell.genericCell, for: indexPath)
            cell.selectionStyle = .none
            cell.addSubview(firstNameTextField)
            let widthTextfield: CGFloat = cell.contentView.bounds.width - Constants.Value.padding
            NSLayoutConstraint.activate([
                firstNameTextField.widthAnchor.constraint(equalToConstant: widthTextfield),
                firstNameTextField.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField)
            ])
            firstNameTextField.centerViewIn(superView: cell)
            return cell
            
        case .lastName:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IdForCell.genericCell, for: indexPath)
            cell.selectionStyle = .none
            cell.addSubview(lastNameTextField)
            let widthTextfield: CGFloat = cell.contentView.bounds.width - Constants.Value.padding
            NSLayoutConstraint.activate([
                lastNameTextField.widthAnchor.constraint(equalToConstant: widthTextfield),
                lastNameTextField.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField)
            ])
            lastNameTextField.centerViewIn(superView: cell)
            return cell
            
        case .email:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IdForCell.genericCell, for: indexPath)
            cell.selectionStyle = .none
            cell.addSubview(emailTextField)
            let widthTextfield: CGFloat = cell.contentView.bounds.width - Constants.Value.padding
            NSLayoutConstraint.activate([
                emailTextField.widthAnchor.constraint(equalToConstant: widthTextfield),
                emailTextField.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField)
            ])
            emailTextField.centerViewIn(superView: cell)
            return cell
            
        case .save:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IdForCell.genericCell, for: indexPath)
            cell.selectionStyle = .none
            cell.addSubview(updateButton)
            let widthTextfield: CGFloat = cell.contentView.bounds.width - Constants.Value.padding
            NSLayoutConstraint.activate([
                updateButton.widthAnchor.constraint(equalToConstant: widthTextfield),
                updateButton.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField)
            ])
            updateButton.centerViewIn(superView: cell)
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch PersonalInformationSections.getSection(indexPath.section){
        case .avatar:
            return 200
        default: return 60
        }
    }
    
}


extension ProfileUserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        }
        
        if textField == lastNameTextField {
            updateData()
        }
        
        return true
    }
    
}




class AvatarCell: BaseTableViewCell {
    
    let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .scaleAspectFit
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 120/2
        avatar.image = UIImage(named: Constants.ImageName.genericAvatar)
        return avatar
    }()
    
    let containerAvatar: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        container.layer.cornerRadius = 120/2
        container.layer.masksToBounds = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: -1, height: 1)
        container.layer.shadowRadius = 5
        container.isUserInteractionEnabled = true
        return container
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFont.getBoldFont()
        label.textAlignment = .center
        return label
    }()
    
    let sizeImageView: CGFloat = 120
    
    func setUpView() {
        selectionStyle = .none
        clipsToBounds = true
        layer.cornerRadius = Constants.Value.cornerRadius
        layer.masksToBounds = true
        
        addSubview(containerAvatar)
        containerAvatar.centerViewIn(superView: contentView)
        containerAvatar.widthAnchor.constraint(equalToConstant: sizeImageView).isActive = true
        containerAvatar.heightAnchor.constraint(equalToConstant: sizeImageView).isActive = true
        
        containerAvatar.addSubview(avatar)
        avatar.centerXAnchor.constraint(equalTo: containerAvatar.centerXAnchor).isActive = true
        avatar.centerYAnchor.constraint(equalTo: containerAvatar.centerYAnchor).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: sizeImageView).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: sizeImageView).isActive = true
        avatar.layer.cornerRadius = sizeImageView/2
        
        addSubview(username)
        username.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        username.heightAnchor.constraint(equalToConstant: 30).isActive = true
        username.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        username.text = "John Doe"
    }
    
    
        
}


