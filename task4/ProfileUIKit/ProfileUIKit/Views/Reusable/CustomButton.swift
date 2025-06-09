import UIKit

class CustomButton: UIButton {
    private var backgroundColotForState: [UIControl.State.RawValue: UIColor] = [:]
    override var isHighlighted: Bool {
        didSet {
            let newColor = backgroundColotForState[state.rawValue] ?? backgroundColor
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = newColor
            }
        }
    }
    
    init(title: String,
         backgroundColor: UIColor = .systemBlue,
         foregroundColor: UIColor = .white,
         cornerRadius: CGFloat = 12,
         font: UIFont = .systemFont(ofSize: 16, weight: .semibold),
         padding: UIEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)) {
        
        super .init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(foregroundColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = font
        
        setBackgroundColor(backgroundColor.withAlphaComponent(0.8), for: .highlighted)
        
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(
            top: padding.top,
            leading: padding.left,
            bottom: padding.bottom,
            trailing: padding.right
        )
        self.configuration = config
    }
        
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        backgroundColotForState[state.rawValue] = color
    }
}
