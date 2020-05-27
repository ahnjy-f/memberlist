Account.create!(
 member_id: "1",
 mail_address: "admin@example.com",
 password: "password",
 admin_flag: "1",
 created_at: DateTime.now,
 updated_at: DateTime.now
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
    大野:オオノ:ono
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
        
        Account.create!(
            member_id: (n*10) + (m+2),
            mail_address: "#{ln[2]}.#{fn[2]}@example.com",
            password: "pw",
            admin_flag: "0",
            created_at: DateTime.now,
            updated_at: DateTime.now
        )
    end
end