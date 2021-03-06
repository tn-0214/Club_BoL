# README

## ツール・ライブラリの名前
 
### ClubBoL
（ゴルフクラブをBorrow or Lendできるアプリ…という意味です。）

## 本番環境

#### URL
https://club-bol.herokuapp.com/

#### ログイン情報（テスト用／出品者)  
- Eメール：lender@lender
- パスワード：abc123

#### ログイン情報（テスト用／購入者）  
- Eメール：buyer@buyer
- パスワード：abc123
 
## 概要および制作意図
 
個人間でのゴルフクラブのレンタルアプリを作成致しました。  
ゴルフクラブは耐用年数が20~30年以上と他のスポーツ器具に比べて  
圧倒的に長寿であるにもかかわらず、使用頻度がとても少なく  
“宝の持ち腐れになりやすい物品である”と言われます。  

そこで近年のリユース/シェアブームと現状を噛み合わせ  
ゴルフクラブを個人間で少額レンタルできる仕組みを作ることで  
下記のような様々なシナジーを生むことができるのではないかと考えました。  

（１）ゴルフクラブの資産価値増加  
ゴルフクラブを使う以外に“レンタルする”という資産化手段が生まれることで  
ゴルフクラブそのものの資産価値向上と購入者の負担軽減を狙います。  

（２）自前のクラブを持たない方へのレンタル手段の拡張  
初心者がクラブを買う際のハードルの一つとして  
「店員の前で試打するのが不安」というものがあり、しかし裏では「試してから買いたい」という本音が隠れています。  
中古ショップなどでの試打以外に「自前でないクラブに触れる機会」を作ることで  
ゴルフプレイヤーの増加およびクラブ購入のミスマッチ防止を狙います。  

（３）手渡しレンタルによるコミュニティ生成  
ゴルフクラブは送料も割高であることから、当アプリでは  
「近場の人から手渡しで借りる」を想定した作りになっています。  
対面で授受を行うことで、個人貸主に対する“お得意さん”や“ゴルフ仲間”など  
各種コミュニティ形成にも寄与できたらいいと考えています。  
 
## 機能(DEMO)
 
- 機能1 新規会員登録
![demo](https://i.gyazo.com/a3c6abaa50f4cf5be55901ab970a5d4d.gif)
deviseを使ったシンプルな登録機能です。  
郵便番号から自動で住所を補完できます。  
※ここで設定した地域が商品の受け取り地域として設定され、後述の地域検索でトリガーになります。

- 機能2 商品出品機能
![demo](https://i.gyazo.com/8e0a7dc8c29de58aaf0572991c113e3d.gif)
画像1点、クラブの説明、取り扱いの注意事項などを記載します。  
商品の値段はdaily priceつまり日割り賃料を設定します。  
即日〜少日数での返却となる場合、出品者の負担が増えると考え「最低貸出日数」を指定できるようにしています。  
出品した商品はルートパスの新着商品に表示されます。

- 機能3 商品購入機能
![demo](https://i.gyazo.com/4b49ab5fdfd4e6373ca1cb3ef061f821.gif)
クレジットカードの情報と借りたい日数を入力するだけでレンタルをすることができます。  
購入者情報などはログイン中ユーザーの情報を引用することで入力工数削減を狙いました。  
加えて、想定以上の出費にならないよう、日数を入力した時点で  
daily price×日数の総額を動的に表示する機能を備えています。

- 機能4 地域検索機能
![demo](https://i.gyazo.com/2d6fb108e2772fa3a130ac797296652d.gif)
機能1で説明した通り、ユーザーの登録住所＝出品住所となります。  
検索したい地域をプルダウンで選択し、実行することで出品住所の絞り込みができます。  
検索はJSONデータを用い、県を選択したら所属する市区町村のみが表示されるようにしました。  
県のみでの検索も可能です。

- 機能5 カテゴリー検索機能
![demo](https://i.gyazo.com/da3f61a167fd9b85e9d0f7e3c0b975ec.gif)
クラブ出品時に登録をしたカテゴリーに対して検索をかけられるフォームです。

 
## 工夫したポイント
 
- 利用者層は若年〜シニア全てが考えられるので、UIはモダンに寄せすぎず、  
  見やすさ/分かりやすさを重視しました。

- ゴルフに関連するサイトであることがひと目で分かるよう、  
  グリーンカラー＋クラブアイコン＋写真の配置などを工夫しました。

- 出品者の確保がアプリ活性化の第一歩だと考え、  
  出品者が一覧画面などを確認しながら相場を調べる→出品に踏み切る…といった流れを想定し、  
  各一覧ページに貸し出しボタンをフロート表示させています。

- 閲覧者（借受側）も相場感を調べてからレンタルに至ると考え、  
  まずはどんなクラブがいくらで貸し出されているのか…を第一に可視化させられるよう  
  一覧画面への遷移を第一に考えて作成しています。

- 地域検索においてはSQLサーバーへのアクセスを減らすため、県idをテーブルに持たせず、  
  publicフォルダに格納したJSONファイルより読み込む仕組みとなっております。
 
## 使用技術
 
### バックエンド
Ruby,Ruby on Rails

### フロントエンド
Erb,Javascript,jQuery

### データベース
MySQL, SequelPro

### 本番環境
Heroku

### ソース管理
GitHub,GitHubDesktop

### テスト
RSpec

### エディタ
VSCode
 
## 課題や今後実装したい機能
 
- 出品者、購入者の相互評価システム（個人間取引のため、信用度向上・トラブル防止に有効だと考えたため）

- 本人確認システム（上記と同様の理由）

- レンタルステータス操作の拡充  
  １．出品者が一時的に商品のレンタルを止める「出品停止機能」および「出品再開機能」  
  ２．現在の仕様は決済開始＝レンタル開始…というシステムになっているが実際にレンタルクラブを渡した際に  
     QR認証などで出品者・購入者がその場で「レンタル開始」にステータスを変える仕様にしたい（日割り賃料のトラブルを防ぐため）  
     返却時にも同様の操作で「レンタル終了」  
  ３．貸し出し終了日までなら何度もレンタル取引を行えるよう、  
     ２．の操作でレンタルが終わった後、自動的に「レンタル可」のステータスに変わるシステム

- 地域検索とカテゴリー検索の統合＋地域検索の拡充  
  簡易地図の上にすでに出品されているクラブがピンで表示されるように

- レンタル品の任意加入保証制度（実運用を想定した場合）

 
## モデル単体テスト
1. ユーザー会員登録機能 実装済み
2. 商品購入機能 実装済み 
3. 商品出品機能 実装済み  
他コントローラーおよび統合テストも随時実装予定
 
## DB設計
 
![ER図(清書)](https://user-images.githubusercontent.com/79251508/114804583-7ec2e580-9ddc-11eb-8f87-c427835fe61e.png)

 
## ワイヤーフレーム

 ![Wireframe(清書)](https://user-images.githubusercontent.com/79251508/114804708-b29e0b00-9ddc-11eb-901c-411adca43eeb.png)
