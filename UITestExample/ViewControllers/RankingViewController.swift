//
//  RankingViewController.swift
//  UITestExample
//
//  Created by hm kim on 2021/11/14.
//

import UIKit

import SnapKit
import Then

final class RankingViewController: UIViewController {

    private enum ProductType {
        case skin
        case cream

        var fileName: String {
            switch self {
            case .skin:
                return "skin"

            case .cream:
                return "cream"
            }
        }
    }

    private lazy var tableView = UITableView().then {
        $0.register(RankingCell.self, forCellReuseIdentifier: "RankingCell")
        $0.dataSource = self
    }

    private var productModels = [ProductModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupProductModels(type: .skin)
    }
}

extension RankingViewController {
    private func setupUI() {
        view.backgroundColor = UIColor.white
        title = "랭킹"

        let skinButton = UIButton().then {
            $0.setTitle("스킨/토너", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
            $0.addTarget(self, action: #selector(tapSkinButton), for: .touchUpInside)
        }
        view.addSubview(skinButton)
        skinButton.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(40)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalToSuperview().inset(24)
        }

        let creamButton = UIButton().then {
            $0.setTitle("크림", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.backgroundColor = UIColor.systemGray6
            $0.addTarget(self, action: #selector(tapCreamButton), for: .touchUpInside)
        }
        view.addSubview(creamButton)
        creamButton.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(40)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalTo(skinButton.snp.trailing).offset(12)
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(skinButton.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func setupProductModels(type: ProductType) {
        let filePath = Bundle.main.path(forResource: type.fileName, ofType: "json")!
        let jsonData = try! String(contentsOfFile: filePath, encoding: .utf8).data(using: .utf8)!
        productModels = try! JSONDecoder().decode([ProductModel].self, from: jsonData)

        tableView.reloadData()
    }

    @objc private func tapSkinButton() {
        setupProductModels(type: .skin)
    }

    @objc private func tapCreamButton() {
        setupProductModels(type: .cream)
    }
}

extension RankingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath) as! RankingCell
        cell.configureCell(model: productModels[indexPath.row])

        return cell
    }
}
