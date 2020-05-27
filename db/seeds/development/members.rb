birthplace = %w(青巻市 赤巻市 黄巻市)

Member.create!(
    last_name: "管理者",
    last_name_phonetic: "かんりしゃ",
    first_name: "管理者",
    first_name_phonetic: "かんりしゃ",
    face_photo_path: "1",

    created_at: DateTime.now,
    updated_at: DateTime.now,
    
    birthplace: birthplace.sample,
    birth_year_month: 19900418,
    joining_year: 20200313,
    one_word_comment: "一言コメント",
    personality: "性格",
    hobby: "趣味",
    favorite_things: "好きなもの",
    hate_things: "嫌いなもの",
    strong_point: "長所",
    week_point: "短所",
    special_skill: "得意なこと",
    week_things: "苦手なこと",
    happy_done_things: "されて嬉しいこと",
    disgusted_things: "されたら嫌なこと",
    freedom_message: "自由欄",
)

last_names = %w{
    佐藤:サトウ:sato
    鈴木:スズキ:suzuki
    高橋:タカハシ:takahashi
    田中:タナカ:tanaka
    渡辺:ワタナベ:watanabe
    伊藤:イトウ:ito
    山本:ヤマモト:yamamoto
    中村:ナカムラ:nakamura
    小林:コバヤシ:kobayashi
    加藤:カトウ:kato
    松本:マツモト:matsumoto
}

first_names = %w{
    一郎:イチロウ:ichiro
    二郎:ジロウ:jiro
    三郎:サブロウ:saburo
    四郎:シロウ:shiro
    五郎:ゴロウ:goro
    松子:マツコ:matsuko
    竹子:タケコ:takeko
    梅子:ウメコ:umeko
    鶴子:ツルコ:tsuruko
    亀子:カメコ:kameko
    光:ヒカル:hikaru
}

10.times do |n|
    10.times do |m|

    ln = last_names[n].split(":")
    fn = first_names[m].split(":")

    Member.create!(
        last_name: ln[0],
        last_name_phonetic: ln[1],
        first_name: fn[0],
        first_name_phonetic: fn[1],
        face_photo_path: "2",

        created_at: DateTime.now,
        updated_at: DateTime.now,
        
        birthplace: birthplace.sample,
        birth_year_month: 19900418,
        joining_year: 20200313,
        one_word_comment: "一言コメント",
        personality: "性格",
        hobby: "趣味",
        favorite_things: "好きなもの",
        hate_things: "嫌いなもの",
        strong_point: "長所",
        week_point: "短所",
        special_skill: "得意なこと",
        week_things: "苦手なこと",
        happy_done_things: "されて嬉しいこと",
        disgusted_things: "されたら嫌なこと",
        freedom_message: "自由欄",
)
    end
end
