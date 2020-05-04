# ジョブ管理

## 実行中のジョブを確認するには

`jobs`コマンド

## バックグラウンドでジョブを実行する方法

コマンドラインの最後に「&」を追加する
`updatedb &`

## ログアウト後もジョブの実行を続けさせたい場合

nohupコマンドを使う。
`nphup updatedb &`

## 実行中のジョブに対し、フォアグラウンド・バックグラウンド変更させたい場合

- `bg ジョブID`：バックグラウンドで動かすように変更
- `fg ジョブID`：フォアグラウンド（見える位置）で動かすように変更