//
//  Feel.swift
//  FeelApp
//
//  Created by 三浦　一真 on 2020/09/23.
//

import RealmSwift

class Feel: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // タイトル
    @objc dynamic var title = ""

    // 今の気持ち
    @objc dynamic var feeling = ""

    // 日時
    @objc dynamic var date = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
