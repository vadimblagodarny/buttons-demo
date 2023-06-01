import UIKit

class ViewController: UIViewController, ViewProtocol {
    var presenter: ViewPresenterProtocol!
    
    let cellId = "CellId"

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: Resources.Image.background)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Resources.Colors.backgroundColor
        view.layer.cornerRadius = 32
        view.addSubview(headerLabel)
        view.addSubview(descriptionOneLabel)
        view.addSubview(carouselOneCollectionView)
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Resources.Text.headerText
        label.textAlignment = .center
        label.font = Resources.Fonts.sfProDisplay2232Bold
        label.textColor = Resources.Colors.textBlackColor
        return label
    }()

    private lazy var descriptionOneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Resources.Text.descriptionOneText
        label.font = Resources.Fonts.sfProDisplay1420Regular
        label.textColor = Resources.Colors.textGrayColor
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.lineHeight = 20
        return label
    }()

    private lazy var carouselOneCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 6
        layout.sectionInset.right = layout.itemSize.width / 1.33
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(backgroundImageView)
        scrollView.addSubview(contentsView)
        return scrollView
    }()
    
    private lazy var subView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wantToJoinLabel)
        view.addSubview(sendRequestButton)
        return view
    }()
    
    private lazy var sendRequestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Resources.Text.sendRequestButtonText, for: .normal)
        button.setTitleColor(Resources.Colors.buttonActiveTextColor, for: .normal)
        button.titleLabel?.font = Resources.Fonts.sfProDisplay1620Medium
        button.layer.cornerRadius = 32
        button.backgroundColor = Resources.Colors.buttonActiveBackground
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 44, bottom: 0, right: 44)
        button.addTarget(self, action: #selector(sendRequestButtonTap), for: .touchUpInside)
        return button
    }()

    private lazy var wantToJoinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Resources.Text.wantToJoinText
        label.font = Resources.Fonts.sfProDisplay1420Medium
        label.textColor = Resources.Colors.textGrayColor
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        view.addSubview(subView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            subView.heightAnchor.constraint(equalToConstant: 60),
            
            wantToJoinLabel.heightAnchor.constraint(equalToConstant: 20),
            wantToJoinLabel.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -20),
            wantToJoinLabel.leadingAnchor.constraint(equalTo: subView.leadingAnchor),

            sendRequestButton.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
            sendRequestButton.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            sendRequestButton.widthAnchor.constraint(equalToConstant: 219),
            sendRequestButton.heightAnchor.constraint(equalToConstant: 60),

            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: subView.topAnchor),
            
            backgroundImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentsView.heightAnchor.constraint(equalToConstant: 216),
            contentsView.bottomAnchor.constraint(equalTo: subView.topAnchor),

            headerLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -20),
            headerLabel.topAnchor.constraint(equalTo: contentsView.topAnchor, constant: 24),
            
            descriptionOneLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 20),
            descriptionOneLabel.widthAnchor.constraint(equalTo: contentsView.widthAnchor, constant: -40),
            descriptionOneLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -20),
            descriptionOneLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            
            carouselOneCollectionView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 20),
            carouselOneCollectionView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -20),
            carouselOneCollectionView.topAnchor.constraint(equalTo: descriptionOneLabel.bottomAnchor, constant: 12),
            carouselOneCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc func sendRequestButtonTap() {
        let alert = UIAlertController(title: Resources.Text.alertTitle,
                                      message: Resources.Text.alertText,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Resources.Text.alertClose, style: .default))
        self.present(alert, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let item = cell.toggleButton()
        presenter.buttonStates[item]!.toggle()

        switch presenter.buttonStates[item]! {
        case true:
            collectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
            presenter.moveItemLeft(item: item, at: indexPath)
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .right, animated: true)
        case false:
            collectionView.moveItem(at: indexPath, to: IndexPath(row: collectionView.numberOfItems(inSection: 0) - 1, section: 0))
            presenter.moveItemRight(item: item, at: indexPath)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.carouselStrings.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        let title = presenter.carouselStrings[indexPath.row]
        let isSelected = presenter.buttonStates[title]!
        cell.configure(title: title, isSelected: isSelected)
        return cell
    }
}
