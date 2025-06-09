import UIKit

struct UserInfoViewModel {
    let name: String
    let age: String
    let location: String
    let followers: String
    let profileImage: UIImage? = UIImage(named: "pfp")
}

class UserInfoView: UIView {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 27.5
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
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private func createInfoRow(iconName: String, text: String) -> UIStackView {
        let imageView = UIImageView(image: UIImage(systemName: iconName))
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.spacing = 5
        stackView.alignment = .center
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return stackView
    }
    
    private lazy var ageStackView = createInfoRow(iconName: "claender", text: "")
    private lazy var locationStackView = createInfoRow(iconName: "mappin.and.ellipse", text: "")
    private lazy var followersStackView = createInfoRow(iconName: "person.2.fill", text: "")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupLayout() {
        let infoItemsStackView = UIStackView(arrangedSubviews: [ageStackView, locationStackView, followersStackView])
        infoItemsStackView.axis = .horizontal
        infoItemsStackView.spacing = 16
        infoItemsStackView.alignment = .center

        let textContentStackView = UIStackView(arrangedSubviews: [nameLabel, infoItemsStackView])
        textContentStackView.axis = .vertical
        textContentStackView.spacing = 8
        textContentStackView.alignment = .leading
        
        let mainStackView = UIStackView(arrangedSubviews: [profileImageView, textContentStackView])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 12
        mainStackView.alignment = .top
        
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 55),
            profileImageView.heightAnchor.constraint(equalToConstant: 55),
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configure(with model: UserInfoViewModel) {
        profileImageView.image = model.profileImage
        nameLabel.text = model.name
        
        (ageStackView.arrangedSubviews.last as? UILabel)?.text = model.age
        (locationStackView.arrangedSubviews.last as? UILabel)?.text = model.location
        (followersStackView.arrangedSubviews.last as? UILabel)?.text = model.followers
    }
}
