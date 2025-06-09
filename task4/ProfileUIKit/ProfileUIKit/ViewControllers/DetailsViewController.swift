import UIKit

class DetailsViewController: UIViewController {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60 // половина от 120
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.3).cgColor
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 3
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    private let infoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.systemBlue.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        return view
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Details"
        
        setupInfoRows()
        setupLayout()
    }
    
    private func setupInfoRows() {
        let infoData = [
            ("Name", "Amina"),
            ("Age", "20"),
            ("Location", "Kazakhstan, Almaty"),
            ("Email", "12345@gmail.com"),
            ("Phone", "12345")
        ]
        
        for (label, value) in infoData {
            let row = InfoRowView(label: label, value: value)
            infoStackView.addArrangedSubview(row)
        }
    }
    
    private func setupLayout() {
        view.addSubview(profileImageView)
        view.addSubview(infoContainerView)
        infoContainerView.addSubview(infoStackView)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            
            infoContainerView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            infoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            infoStackView.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 20),
            infoStackView.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -20),
            infoStackView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: -20)
        ])
    }
}
