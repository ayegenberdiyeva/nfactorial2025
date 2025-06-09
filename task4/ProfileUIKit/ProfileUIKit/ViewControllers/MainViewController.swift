import UIKit

class MainViewController: UIViewController {
    private let userInfoView = UserInfoView()
    
    private let detailsButton: CustomButton = {
        let button = CustomButton(title: "Details")
        button.addTarget(MainViewController.self, action: #selector(didTapDetailsButton), for: .touchUpInside)
        return button
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
        
    private let postView = PostListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
        
        //
    }
    
    private func setupUI() {
        view.addSubview(userInfoView)
        view.addSubview(detailsButton)
        view.addSubview(dividerView)
        view.addSubview(postView)
        
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        postView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsButton.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 20),
            detailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            dividerView.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 20),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1),

            postView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureData() {
        userInfoView.configure(with: .init(name: "Amina", age: "20", location: "Almaty", followers: "123"))
        
        let posts = [
            Post(id: UUID(), title: "First Post", content: "123456789"),
            Post(id: UUID(), title: "Second Post", content: "qwertyuio")
        ]
        postView.configure(with: posts)
    }
    
    @objc private func didTapDetailsButton() {
        let detailsVC = DetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
