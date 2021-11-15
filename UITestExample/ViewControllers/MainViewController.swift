//
//  ViewController.swift
//  UITestExample
//
//  Created by hm kim on 2021/11/14.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension MainViewController {
    private func setupUI() {
        let stackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 12
            $0.distribution = .fillEqually
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(80)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
        }

        let rankingButton = UIButton().then {
            $0.setTitle("랭킹", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
            $0.addTarget(self, action: #selector(tapRankingButton), for: .touchUpInside)
        }
        stackView.addArrangedSubview(rankingButton)

        let shoppingButton = UIButton().then {
            $0.setTitle("쇼핑", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
        }
        stackView.addArrangedSubview(shoppingButton)

        let categoryButton = UIButton().then {
            $0.setTitle("카테고리", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
        }
        stackView.addArrangedSubview(categoryButton)

        let ingredientButton = UIButton().then {
            $0.setTitle("성분", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
        }
        stackView.addArrangedSubview(ingredientButton)
    }

    @objc private func tapRankingButton() {
        let rankingViewController = RankingViewController()
        navigationController?.pushViewController(rankingViewController, animated: true)
    }
}
