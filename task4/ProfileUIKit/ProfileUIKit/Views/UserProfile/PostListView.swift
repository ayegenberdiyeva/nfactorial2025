import UIKit

struct Post{
    let id: UUID
    let title: String
    let content: String
}

class PostListView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Posts"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let postsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupLayout() {
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, postsStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        
        // Отступы для заголовка и постов
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configure(with posts: [Post]) {
        postsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for post in posts {
            let postEntryView = createPostEntryView(for: post)
            postsStackView.addArrangedSubview(postEntryView)
        }
    }
    
    private func createPostEntryView(for post: Post) -> UIView {
        let title = UILabel()
        titleLabel.text = post.title
        title.font = .systemFont(ofSize: 17, weight: .bold)
        
        let contentLabel = UILabel()
        contentLabel.text = post.content
        contentLabel.font = .systemFont(ofSize: 15)
        contentLabel.textColor = .secondaryLabel
        contentLabel.numberOfLines = 0
        
        let divider = UIView()
        divider.backgroundColor = .lightGray.withAlphaComponent(0.5)
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [title, contentLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        return stackView
    }
}
