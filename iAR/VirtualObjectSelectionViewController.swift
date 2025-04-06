//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import UIKit

class VirtualObjectSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {

    private var tableView: UITableView!
    private var size: CGSize!
    weak var delegate: VirtualObjectSelectionViewControllerDelegate?
    private var backgroundView: UIView!
    private var containerView: UIView!

    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        // Add semi-transparent background that covers the whole screen
        backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.alpha = 0
        
        // Add tap gesture to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
        backgroundView.addGestureRecognizer(tapGesture)
        
        view.addSubview(backgroundView)

        // Container view for the table
        containerView = UIView()
        containerView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 8
        containerView.layer.shadowOpacity = 0.3
        view.addSubview(containerView)

        // Setup TableView with proper positioning
        tableView = UITableView()
        if UIDevice.current.userInterfaceIdiom == .phone {
            // Center the tableView for iPhone with adjusted size
            let width: CGFloat = min(280, UIScreen.main.bounds.width - 40)
            let height: CGFloat = CGFloat(VirtualObjectSelectionViewController.COUNT_OBJECTS * 60)
            size = CGSize(width: width, height: height)
            
            // Position container at the bottom near the + button
            containerView.frame = CGRect(x: (UIScreen.main.bounds.width - width) / 2,
                                      y: UIScreen.main.bounds.height,
                                      width: width,
                                      height: height)
            
            tableView.frame = containerView.bounds
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(white: 0.3, alpha: 1.0)
        tableView.separatorInset = .zero
        tableView.bounces = false
        tableView.rowHeight = 60
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false

        containerView.addSubview(tableView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Animate the appearance
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundView.alpha = 1
            
            // Animate container up from the bottom
            if UIDevice.current.userInterfaceIdiom == .phone {
                let finalY = UIScreen.main.bounds.height - self.containerView.frame.height - 100
                self.containerView.frame.origin.y = finalY
            }
        })
    }

    @objc private func handleBackgroundTap() {
        dismissWithAnimation()
    }
    
    private func dismissWithAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0
            
            // Animate container back down
            if UIDevice.current.userInterfaceIdiom == .phone {
                self.containerView.frame.origin.y = UIScreen.main.bounds.height
            }
        }) { _ in
            self.dismiss(animated: false)
        }
    }

    // MARK: - Object Handling
    func getObject(index: Int) -> VirtualObject {
        switch index {
        case 0: return Candle()
        case 1: return Cup()
        case 2: return Vase()
        case 3: return Lamp()
        case 4: return Chair()
        default: return Cup()
        }
    }

    static let COUNT_OBJECTS = 5

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = getObject(index: indexPath.row)
        delegate?.virtualObjectSelectionViewController(self, object: selectedObject)
        dismissWithAnimation()
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VirtualObjectSelectionViewController.COUNT_OBJECTS
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ObjectCell")
        
        // Configure cell appearance
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        
        // Create and configure icon
        let icon = UIImageView(frame: CGRect(x: 15, y: 15, width: 30, height: 30))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .white
        
        // Create and configure label
        let label = UILabel(frame: CGRect(x: 60, y: 15, width: tableView.bounds.width - 80, height: 30))
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)

        let object = getObject(index: indexPath.row)
        var thumbnailImage = object.thumbImage!
        if let invertedImage = thumbnailImage.inverted() {
            thumbnailImage = invertedImage
        }
        
        label.text = object.title
        icon.image = thumbnailImage
        
        cell.contentView.addSubview(icon)
        cell.contentView.addSubview(label)

        return cell
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = .clear
    }
}

// MARK: - VirtualObjectSelectionViewControllerDelegate
protocol VirtualObjectSelectionViewControllerDelegate: AnyObject {
    func virtualObjectSelectionViewController(_: VirtualObjectSelectionViewController, object: VirtualObject)
}
