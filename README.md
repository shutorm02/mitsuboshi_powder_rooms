![Untitled](https://user-images.githubusercontent.com/93573830/184815454-d0f44b93-821d-438c-893c-4632c9ce7f2d.png)

## サービス概要
**たとえ家の外であっても、
三つ星ホテルのようにキレイなトイレを使いたい、
そんな女性のためのトイレ検索サービスです。**

## ターゲットユーザー
いつも清潔なトイレを使いたい女性。
（特におしゃれに気を使う人、小さいお子さん連れのお母さん）

**<details><summary>ユーザーが抱える問題</summary>**
    
    デパートや駅のトイレに入って、こんな経験をしたことはありませんか？
    
    「せっかくおしゃれしてきたのに、トイレが汚れていた…」
    「あわててトイレに入ったら、見たくないものを見てしまった…」
    
    また、小さなお子さんを持つお母さんには、このような経験もあるかもしれません。
    
    「ベビーキープがなくて、ゆっくりトイレにもいけない…」
    「子どものオムツを替えたいのに、場所が見当たらない！」
    
    三つ星トイレでは、
    そんな家の外でのトイレ事情に悩むすべての女性のために、
    日本全国のまるで三つ星ホテルのようにいたれりつくせり…、なトイレを取り揃えました。

</details>
    
**<details><summary>このサービスで解決できること</summary>**
    
    「三つ星トイレ」には、三つの評価基準があります。
    
    -----------------------------------------
    【三ツ星トイレの評価基準】
    
    ・　丈の長い洋服でも安心して入れるくらい清潔であること
    ・　ゆっくり身だしなみが整えられること
    ・　子育て中の女性にうれしい機能が充実していること
    -----------------------------------------
    
    現在地や目的地周辺にある、
    評価の高い、また、あなたのゆずれないポイント（パウダールームが広い、おむつ替え台があるなど）から、
    清潔なトイレを検索することができます。
</details>

## 実装予定の機能
#### 【すべてのユーザー】
- スポット検索機能
    - 現在地または目的地、こだわりポイント、評価（星の数）から絞り込み
    - Mapと一覧表示の切り替え

#### 【登録ユーザーのみ】
- スポットを評価
    - 星の数、コメントスタンプ、ほかユーザーのコメントに対する評価
- スポットをお気に入りに追加
- 新しいスポットを追加
    - 住所、写真、評価
- マイページの編集
    - 自分の投稿したスポット、評価、コメントを編集・削除
    - プロフィールの変更

#### 【管理ユーザーのみ】
- 登録ユーザーの検索、一覧、詳細、編集
- スポットの検索、一覧、詳細、編集、削除
- コメントの検索、一覧、詳細、編集、削除
- 管理ユーザーの一覧、詳細、編集、削除

## バージョン情報
- Ruby 3.1.2
- Rails 6.1.6

## 画面遷移図
URLは[こちら](https://www.figma.com/file/xYW06Nc9itu7CjivC8X40y/%E4%B8%89%E3%81%A4%E6%98%9F%E3%83%88%E3%82%A4%E3%83%AC?node-id=0%3A1)

## ER図
[![Image from Gyazo](https://i.gyazo.com/c5ef4a7c5a544ab7ecb69a88e422182a.png)](https://gyazo.com/c5ef4a7c5a544ab7ecb69a88e422182a)

## 開発スケジュール
企画〜技術調査：6/25〆切<br>
README〜ER図作成：6/25 〆切<br>
メイン機能実装：6/25 - 8/30<br>
β版をRUNTEQ内リリース（MVP）：8/30〆切<br>
RUNTEQ内リリース（MVP）後、機能実装：10/12　　- 10/23<br>
本番リリース：10/23

## サイト内で使用している素材
こちらからお借りしています。
- [Wartercolor Design Site.](https://watercolor.paintmarks.com/)
- [農民イラスト](https://nawmin.com)
- [Loose Drawing](https://loosedrawing.com/)
