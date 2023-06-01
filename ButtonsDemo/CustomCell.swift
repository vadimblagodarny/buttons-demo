import UIKit

class CustomCell: UICollectionViewCell {

    private lazy var carouselButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        button.titleLabel?.font = Resources.Fonts.sfProDisplay1420Medium
        button.layer.cornerRadius = 12
        button.setTitleColor(Resources.Colors.buttonInactiveTextColor, for: .normal)
        button.setTitleColor(Resources.Colors.buttonActiveTextColor, for: .selected)
        button.backgroundColor = Resources.Colors.buttonInactiveBackground
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(carouselButton)
        carouselButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        carouselButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        carouselButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, isSelected: Bool) {
        carouselButton.setTitle(title, for: .normal)
        carouselButton.isSelected = isSelected
        setButtonBackground()
    }
    
    func toggleButton() -> String {
        carouselButton.isSelected.toggle()
        setButtonBackground()
        return (carouselButton.titleLabel?.text)!
    }
    
    func setButtonBackground() {
        switch carouselButton.isSelected {
        case true: carouselButton.backgroundColor = Resources.Colors.buttonActiveBackground
        case false: carouselButton.backgroundColor = Resources.Colors.buttonInactiveBackground
        }
    }
}
