//
//  ViewController.swift
//  Dynamic-Header-Offset-TableView
//
//  Created by NishiokaKohei on 2022/10/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var progress: CGFloat = 0.0 {
        didSet {
            print("[\(#function)] \(progress)")
            headerHeightConstraint.constant = 150 * (1.0 - progress)
        }
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "No.\(indexPath.row)"
        return cell
    }

}

extension ViewController {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0 {
            print("down")
            showHeader()
            showTabBar(animated: true)
        } else {
            print("up")
            hideHeader()
            hideTabBar(animated: true)
        }
    }

    func showHeader() {
        var nextProgress = progress - 0.05

        if progress < .zero {
            nextProgress = .zero
        }
        if progress < 0.2 {
            nextProgress = 0.0
        }
        if progress <= 0.4 {
            nextProgress -= 0.05
        }
        if progress <= 0.6 {
            nextProgress -= 0.05
        }
        if progress > 1.0 {
            progress = 1.0
            return
        }

        progress = nextProgress
    }

    func hideHeader() {
        var nextProgress = progress + 0.02

        if progress < .zero {
            nextProgress = .zero
        }
        if progress > 0.5 {
            nextProgress += 0.02
        }
        if progress > 0.8 {
            nextProgress = 1.0
        }
        if progress > 1.0 {
            nextProgress = 1.0
        }

        progress = nextProgress

    }

    func showTabBar(animated: Bool = false) {
        guard let tabBarController = tabBarController else { return }
        if animated {
            var frame = tabBarController.tabBar.frame
            // タブ自身の高さ分だけ上方向に移動させる
            frame.origin.y = view.frame.size.height - frame.size.height
            UIView.animate(withDuration: 0.5) {
                tabBarController.tabBar.frame = frame
            }
        } else {
            tabBarController.tabBar.isHidden = false
        }
    }

    func hideTabBar(animated: Bool = false) {
        guard let tabBarController = tabBarController else { return }
        if animated {
            var frame = tabBarController.tabBar.frame
            // タブ自身の高さ分だけ下方向に移動させる
            frame.origin.y = view.frame.size.height + frame.size.height
            UIView.animate(withDuration: 0.5) {
                tabBarController.tabBar.frame = frame
            }
        } else {
            tabBarController.tabBar.isHidden = true
        }
    }


}
