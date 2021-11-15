//
//  RankingCell.swift
//  UITestExample
//
//  Created by hm kim on 2021/11/14.
//

import UIKit

import SnapKit
import Then

final class RankingCell: UITableViewCell {

    let rankingLabel = UILabel().then {
        $0.textAlignment = .center
    }

    let brandNameLabel = UILabel().then {
        $0.textColor = UIColor.systemGray
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }

    let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }

    let priceInfolabel = UILabel().then {
        $0.textColor = UIColor.systemGray
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("error")
    }

    func configureCell(model: ProductModel) {
        if model.adPurchaseId > 0 {
            rankingLabel.text = "추천"
        } else {
            rankingLabel.text = "\(model.rank)등"
        }

        brandNameLabel.text = model.brandName
        productNameLabel.text = model.name
        priceInfolabel.text = model.priceInfo
    }
}

extension RankingCell {
    private func setupUI() {
        selectionStyle = .none

        contentView.addSubview(rankingLabel)
        rankingLabel.snp.makeConstraints {
            $0.width.height.greaterThanOrEqualTo(100)
            $0.top.leading.bottom.equalToSuperview()
        }

        contentView.addSubview(brandNameLabel)
        brandNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalTo(rankingLabel.snp.trailing)
        }

        contentView.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(rankingLabel.snp.centerY)
            $0.leading.equalTo(rankingLabel.snp.trailing)
        }

        contentView.addSubview(priceInfolabel)
        priceInfolabel.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(24)
        }
    }
}
