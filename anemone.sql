set names utf8;
set foreign_key_checks = 0;
drop database if exists anemone;

create database if not exists anemone;
use anemone;


drop table if exists user_info;
create table user_info(
	id int not null primary key auto_increment,
	user_id varchar(16) unique not null,
	password varchar(16) not null,
	family_name varchar(32) not null,
	first_name varchar(32) not null,
	family_name_kana varchar(32) not null,
	first_name_kana varchar(32) not null,
	sex tinyint default 0 not null,
	email varchar(32) not null,
	status tinyint default 0 not null,
	logined tinyint default 0 not null,
	regist_date datetime not null,
	update_date datetime default now()
);


drop table if exists product_info;
create table product_info(
	id int not null primary key auto_increment,
	product_id int unique not null,
	product_name varchar(100) unique not null,
	product_name_kana varchar(100) unique not null,
	product_description varchar(255) not null,
	category_id int not null,
	price int,
	image_file_path varchar(100),
	image_file_name varchar(50),
	release_date datetime not null,
	release_company varchar(50),
	status tinyint default 0 not null,
	regist_date datetime not null,
	update_date datetime default now()
);


drop table if exists cart_info;
create table cart_info(
	id int not null primary key auto_increment,
	user_id varchar(16) not null,
	temp_user_id varchar(16),
	product_id int,
	product_count int not null,
	price int not null,
	regist_date datetime not null,
	update_date datetime default now()
);


drop table if exists purchase_history_info;
create table purchase_history_info(
	id int not null primary key auto_increment,
	user_id varchar(16) not null,
	product_id int not null,
	product_count int not null,
	price int not null,
	destination_id int not null,
	regist_date datetime not null,
	update_date datetime default now()
);


drop table if exists destination_info;
create table destination_info(
	id int not null primary key auto_increment,
	user_id varchar(16) not null,
	family_name varchar(32) not null,
	first_name varchar(32) not null,
	family_name_kana varchar(32) not null,
	first_name_kana varchar(32) not null,
	email varchar(32) not null,
	tel_number varchar(13) not null,
	user_address varchar(50) not null,
	regist_date datetime not null,
	update_date datetime default now()
);


drop table if exists m_category;
create table m_category(
	id int not null primary key auto_increment,
	category_id int unique not null,
	category_name varchar(20) unique not null,
	category_description varchar(100) ,
	insert_date datetime not null,
	update_date datetime default now()
);

insert into m_category(category_id, category_name, category_description, insert_date)
values (0, "全てのカテゴリー", "category_description", now()),
		(1, "酒", "category_description", now()),
		(2, "炭酸", "category_description", now()),
		(3, "健康", "category_description", now());
insert into user_info(user_id, password, family_name, first_name, family_name_kana, first_name_kana, sex, email, status,
logined, regist_date)
values 	("guest" , "guest", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
("guest2", "guest2", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest3", "guest3", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest4", "guest4", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest5", "guest5", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest6", "guest6", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest7", "guest7", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest8", "guest8", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest9", "guest9", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest10", "guest10", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest11", "guest11", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now()),
 ("guest12", "guest12", "family_name", "first_name", "family_name_kana", "first_name_kana",
0, "email", 0, 0, now());

insert into product_info values
	(1, 1, "瓶ビール", "びんびーる", "定番の一品", 1, 1000, "./images", "beeeeeru.jpg",
	now(), "居酒屋", 1, now(), now()),
	(2, 2, "生ビール", "なまびーる", "定番のビールです", 1, 1000, "./images", "intro_gra.jpg",
	now(), "朝日", 1, now(), now()),
	(3, 3, "日本酒", "にほんしゅ", "伝統的な味です", 1, 2000, "./images", "171220_img01.jpg",
	now(), "日本株式会社", 1, now(), now()),
	(4, 4, "赤ワイン", "あかわいん", "おしゃれです", 1, 3000, "./images", "20170615-10.jpg",
	now(), "ワイン株式会社", 1, now(), now()),
	(5, 5, "白ワイン", "しろわいん", "しろいです", 1, 4000, "./images", "DLARGE.JPG",
	now(), "白ワイン株式会社", 1, now(), now()),
	(6, 6, "カシスオレンジ", "かしすおれんじ", "飲みやすいです", 1, 5000, "./images", "gettyimages-79300742-612x612.jpg",
	now(), "カシス株式会社", 1, now(), now()),
	(7, 7, "朝日スーパードライ", "あさひすーぱーどらい", "ビールです", 1, 6000, "./images", "4901004035400.JPG",
	now(), "朝日", 1, now(), now()),
	(8, 8, "ハイボール", "はいぼーる", "よくあるハイボールです", 1, 7000, "./images", "9714794_3L1.jpg",
	now(), "ボール株式会社", 1, now(), now()),
	(9, 9, "梅酒", "うめしゅ", "梅の味です", 1, 8000, "./images", "1394732_3L1.jpg",
	now(), "梅社", 1, now(), now()),
	(10, 10, "テキーラ", "てきーら", "強いです", 1, 10000, "./images", "600130_1.jpg",
	now(), "合資会社テキーラ", 1, now(), now()),
	(12, 12, "コカコーラ", "こかこーら", "炭酸の定番です", 2, 2000, "./images", "3219769_3L1.jpg",
	now(), "コカコーラ株式会社", 1, now(), now()),
	(13, 13, "ジンジャエール", "じんじゃえーる", "大人の味です", 2, 3000, "./images", "41Ud5qwqJSL._SY445_.jpg",
	now(), "ジンジャエール社", 1, now(), now()),
	(14, 14, "ソーダ", "そーだ", "昔からあるソーダです", 2, 4000, "./images", "N859175_3L1.jpg",
	now(), "合同会社ソーダ", 1, now(), now()),
	(15, 15, "カルピスソーダ", "かるぴすそーだ", "カルピスとソーダを混ぜました", 2, 5000, "./images", "61huPGBMCvL._SX425_.jpg",
	now(), "株式会社ヤクルト", 1, now(), now()),
	(16, 16, "コ力コーラ", "こちからこーら", "※画像はイメージです。", 2, 6000, "./images", "5dc48b7d9e5b7fee9b02ae7cc721345e_600.jpg",
	now(), "株式会社コチカラ", 1, now(), now()),
	(17, 17, "炭酸水", "たんさんすい", "刺激的な水です", 2, 7000, "./images", "9865304_3L1.jpg",
	now(), "水株式会社", 1, now(), now()),
	(18, 18, "オランジーナ", "おらんじーな", "オレンジジュースと炭酸を混ぜました", 2, 8000, "./images", "l_sbf0106-2.jpg",
	now(), "ヨーロピアン株式会社", 1, now(), now()),
	(19, 19, "桃炭酸", "ももたんさん", "桃風味炭酸水", 2, 9000, "./images", "Shouhin_14098_1.jpg",
	now(), "ピーチウォーター社", 1, now(), now()),
	(20, 20, "ファンタグレープ", "ふぁんたぐれーぷ", "定番炭酸ジュースぶどう味", 2, 10000, "./images", "61U+F6HuOoL._SY445_.jpg",
	now(), "ファンタ", 1, now(), now()),
	(21, 21, "ファンタオレンジ", "ふぁんたおれんじ", "定番炭酸オレンジ", 2, 11000, "./images", "8889910_l1.jpg",
	now(), "ファンタ", 1, now(), now()),
	(22, 22, "私の青汁", "わたしのあおじる", "健康への第一歩", 3, 1000, "./images", "img_pack_myaojiru_pkg.jpg",
	now(), "ヤクルト", 1, now(), now()),
	(23, 23, "しじみ70個分の味噌汁", "しじみななじゅっこぶんのみそしる", "和食は健康的", 3, 2000, "./images", "p179_l.jpg",
	now(), "ヤクルト", 1, now(), now()),
	(24, 24, "ヘルシア", "へるしあ", "脂肪を燃やします", 3, 3000, "./images", "9721663_3L1.jpg",
	now(), "ヘルシア株式会社", 1, now(), now()),
	(25, 25, "高麗人参エキス", "こうらいにんじんえきす", "高麗の人参を使った元気の出るエキスです", 3, 4000, "./images", "e2e65c06d486bccb24caad7a29cf7d85.jpg",
	now(), "サランバン", 1, now(), now()),
	(26, 26, "チョコラBBドリンクプラス", "ちょこらびーびーどりんくぷらす", "脂肪の代謝を助け、エネルギーにかえるビタミンB2に加え、アミノ酸を配合。", 3, 5000, "./images", "thm_bbroyal2.jpg",
	now(), "チョコラ", 1, now(), now()),
	(27, 27, "プロテイン", "ぷろていん", "お子様の手の届かない場所で保管してください。", 3, 6000, "./images", "morinagaseika_saz02036.jpg",
	now(), "株式会社マッチョ", 1, now(), now()),
	(28, 28, "風邪薬ウォーター", "かぜぐすりうぉーたー", "液体状の風邪薬です", 3, 7000, "./images", "1370258_3L1.jpg",
	now(), "(株)発熱", 1, now(), now()),
	(29, 29, "元気ドリンク", "げんきどりんく", "スタミナがあがります。", 3, 8000, "./images", "2174733_3L1.jpg",
	now(), "モンスター株式会社", 1, now(), now()),
	(30, 30, "輝きの青汁", "かがやきのあおじる", "ゴーヤ配合！", 3, 9000, "./images", "th_1K8A6845.jpg",
	now(), "青汁会社カガヤキ", 1, now(), now()),
	(31, 31, "セノビック", "せのびっく", "背が伸びます", 3, 10000, "./images", "9283-1518222081-3.jpg",
	now(), "セノビック株式会社", 1, now(), now()),
	(32, 32, "炭酸ボンベ", "たんさんぼんべ", "こちらの商品は飲料です。", 2, 147, "./images", "b4edc23c.JPG",
	now(), "サントリー", 1, now(), now()),
	(33, 33, "オルチャータ", "おるちゃーた", "オルチャータの起源は大麦を使った飲料であり、名前もラテン語で大麦を意味するホルデウムに由来している。大麦を使った飲料はヨーロッパ各国で独自に発展し、スペインではキハマスゲを使用するオルチャータ・デ・チュファなどに変化した。キハマスゲの地下茎の絞り汁に水、砂糖もしくは蜂蜜を加えて作られるのがオルチャータ・デ・チュファである。通常スペインでオルチャータと呼ぶ場合はチュファを原料とするものを指す。乳白色もしくはわずかに黄色がかった乳白色で、牛乳のようなまろやかな味わいと独特の香ばしい風味がある(Wiki)", 3, 398, "./images", "057db142753831.57d6ac0512ec3.jpg",
	now(), "中南米、スペイン(株)", 1, now(), now()),
	(34, 34, "ベンティアドショットヘーゼルナッツバニラアーモンドキャラメルエキストラホイップキャラメルソースモカソースランバチップチョコレートクリームフラペチーノ", "べんてぃあどしょっとへーぜるなっつばにらあーもんどきゃらめるえきすとらほいっぷきゃらめるそーすもかそーすらんばちっぷちょこれーとくりーむふらぺちーの", "実在する商品です。", 3, 940, "./images", "BOIc49dCMAAaNMW.jpg",
	now(), "スターバックスコーヒー", 1, now(), now()),
	(35, 35, "野菜のカレースープ", "やさいのかれーすーぷ", "カレーは飲み物です。", 3, 130, "./images", "ogp-9.jpg",
	now(), "SUNTORY", 1, now(), now()),
	(36, 36, "牛タンサイダー", "ぎゅうたんさいだー", "牛タン風味。", 2, 250, "./images", "41oIXdTFOcL.jpg",
	now(), "伊達なおみやげ堂", 1, now(), now()),
	(37, 37, "うなぎコーラ", "うなぎこーら", "原材料:うなぎエキス", 2, 216, "./images", "71CDWqOmJCL._SL1500_.jpg",
	now(), "木村飲料", 1, now(), now()),
	(38, 38, "たこやき風ラムネ8本セット", "たこやきふうらむねはっぽんせっと", "こちらの商品はたこ焼きではありません。", 2, 992, "./images", "812OhC0gE3L._SL1500_.jpg",
	now(), "ハタ鉱泉株式会社", 1, now(), now()),
	(39, 39, "ドリアンサイダー24本セット", "どりあんさいだーにじゅうよんほんせっと", "商品サイズ(高さx奥行x幅):16cm×28.5cm×16cm", 2, 2425, "./images", "61nqQkoK5wL._SL1000_.jpg",
	now(), "友桝飲料", 1, now(), now()),
	(40, 40, "群馬泉", "ぐんまいずみ", "原産国：群馬", 1, 2981, "./images", "31tI8JHYljL.jpg",
	now(), "島岡酒造", 1, now(), now()),
	(41, 41, "東京の天然水", "とうきょうのてんねんすい", "自然が育む恵みをあなたへ （お急ぎ便をご利用の方は水道へ）", 3, 0, "./images", "tokyosui.jpg",
	now(), "東京都", 1, now(), now()),
	(42, 42, "宇宙水", "すぺーすうぉーたー", "お客様の声：私はこれを飲んでから、若返ったような気がします！(★★★★★)  僕はこれを飲んでから、体の毒素が消えたような気がします！(★★★★★)  あなたも宇宙のパワーを感じませんか？", 3, 1000000, "./images", "spacewater.jpg",
	now(), "NASSA", 1, now(), now()),
	(43, 43, "カルキング", "かるきんぐ", "カルキング♪カルキング♪(CM)", 3, 100, "./images", "4902102035491.jpg",
	now(), "キリン", 1, now(), now()),
	(44, 44, "ポカリスエット・ステビア", "ぽかりすえっと・すてびあ", "昔のポカリスエットです。瓶でも売られていました。", 3, 200, "./images", "pocari-stevia.jpg",
	now(), "大塚製薬", 1, now(), now()),
	(45, 45, "Teao", "てぃお", "懐かしのストレートティー", 3, 150, "./images", "ash-teao-s.jpg",
	now(), "Asahi", 1, now(), now()),
    (46, 46, "はげあたま", "はげあたま", "贈る相手には注意", 1, 980, "./images", "415Dfi6CNdL.jpg",
	now(), "神酒造", 1, now(), now()),
	(47, 47, "俺の出番", "おれのでばん", "豊かな風味と切れ味がよい辛口なお酒です。", 1, 1404, "./images", "318ghWJNbsL.jpg",
	now(), "国権酒造", 1, now(), now()),
	(48, 48, "勇気百倍", "ゆうきひゃくばい", "アンパンとは関係ありません。", 1, 657, "./images", "51zycTvohlL._SL1210_.jpg",
	now(), "(株)アンパマン", 1, now(), now()),
	(49, 49, "飲むミドリムシ", "のむみどりむし", "ミドリムシ味", 3, 243, "./images", "718cQYcKI8L._SL1500_.jpg",
	now(), "ユーグレナ", 1, now(), now()),
	(50, 50, "ラテアート", "らてあーと", "飲む芸術", 3, 520, "./images", "coffeeripples-61.jpg",
	now(), "カフェラッテ社", 1, now(), now()),
	(51, 51, "クマちゃんハチミツ(オレンジの花)340g", "くまちゃんはちみつ(おれんじのはな)さんびゃくよんじゅうぐらむ", "毎日1カートン購入してます。お肌もつやつやです。(5歳 男性 熊) ", 3, 1404, "./images", "51hgLzC2PhL._SL1000_.jpg",
	now(), "ウォルト・ディズニー", 1, now(), now()),
	(52, 52, "SMAP ジュース(飲めません)", "すまっぷじゅーす", "シンゴー！シンゴー！", 3, 1000, "./images", "hqdefault.jpg",
	now(), "ジャニーズ事務所", 1, now(), now()),
    (53, 53, "メガネ専用", "めがねせんよう", "「メガネ拭き」付いてます！", 1, 1300, "./images", "imgrc0075546614.jpg",
	now(), "メガネスーパー", 1, now(), now()),
	(54, 54, "沖縄産ゴーヤー原液", "おきなわさんごーやーげんえき", "ゴーヤー丸ごと原液タイプ", 1, 5000, "./images", "imgrc0078569913.jpg",
	now(), "株式会社ヘチマ", 1, now(), now()),
	(55, 55, "最低野郎", "さいていやろう", "明日やろうは馬鹿野郎", 1, 1000, "./images", "31jYG2bsuzL.jpg",
	now(), "最低酒造", 1, now(), now()),
	(56, 56, "Romane Conti", "ろまねこんてぃ", "自分へのご褒美に...", 1, 3780000, "./images", "17101-002b.jpg",
	now(), "おフランス", 1, now(), now()),
	(57, 57, "シンデレラシューウォッカ", "しんでれらしゅーうぉっか", "Hurry up,dear.The ball can’t wait.(さぁ急がなきゃ。舞踏会は待ってはくれないわ。購入するのよ。)", 1, 16200, "./images", "sophia-crystal_cinderella-s1.jpg", now(), "シンデレラの足", 1, now(), now()),
    (58, 58, "エセビール", "えせびーる", "お酒は20歳になってから", 1, 2241, "./images", "060228_02.jpg",
	now(), "酒乱チルドレン（株）", 1, now(), now()),
	(59, 59, "力水", "ちからみず", "※画像は実物とは異なります。", 1, 140, "./images", "bodybuilding_pose_6.jpg",
	now(), "キリン", 1, now(), now());