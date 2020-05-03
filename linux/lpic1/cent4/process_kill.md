# プロセスの監視

## 動いているプロセスを監視するには

psコマンドを使う。<br>
- ```ps aux```
- ```ps -e```
どちらかで、全部みれる。
動的な監視はtopコマンドで。

## プロセスを検索するには

`pgrep`コマンドによって、指定されたプロセス名に対応するPIDを調べることができる。
- `pgrep vim`：vimプロセスのPIDを調べる
- `pgrep -u vagrant`：プロセスの実行ユーザーが「vagrant」であるプロセスのPIDを調べる
- `pgrep -g vagrant`：プロセスの実行グループが「vagrant」であるプロセスのPIDを調べる

## プロセスの終了

killコマンドを使う。
- ```kill -9 ...```：強制終了（KILL）
- ```kill -15 ...```：終了（正常終了・TERM）

killコマンドは、シグナルを指定した後に<strong>PID</strong>を指定して実行する。<br>
シグナルを指定しなかったら、デフォルトは「15（TERM）」。<br>
シグナルの指定については、下記の4つの指定方法がある。（PIDを560とすると）

- `kill -15 560`
- `kill -s 15 560`
- `kill -TERM 560`
- `kill -SIGTERM 560`

## killコマンド・プロセス名での指定

killコマンドは、PIDでしか実行指定ができない。<br>
しかし`killall`・`pkill`コマンドでは、プロセス名指定により実行できる。<br>

killallコマンドでは、指定されたプロセス名すべてに対して、同じく指定されたシグナルが送られる。<br>
- `killall -15 vim`

pkillでは、シグナルを送るユーザー・グループを指定することができる。<br>
（下記ではデフォルトのTERMシグナルが送られる）
- `pkill -u vagrant vim`
- `pkill -g vagrant vim`
