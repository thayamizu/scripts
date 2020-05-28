#!/bin/bash
echo -n 管理者パスワードを入力してください
read passwd

echo -n コピー元のアカウント名を入力してください
read src

echo -n コピー先のアカウントを入力してください
read dest

# ユーザーデータの移行
echo "$passwd" | sudo -s cp -f /Users/$src/* Users/$dest/

echo デスクトップのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Desktop/ /Users/$dest/Desktop/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Desktop

echo ドキュメントのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Documents/ /Users/$dest/Documents/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Documents

echo ダウンロードのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Downloads/ /Users/$dest/Downloads/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Downloads

echo ミュージックのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Music/ /Users/$dest/Music/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Music

echo ムービーのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Movies/ /Users/$dest/Movies/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Movies

echo ピクチャのデータをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Pictures/ /Users/$dest/Pictures/
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Pictures

echo ドック設定をコピーします・・・
echo "$passwd" | sudo -s cp -f /Users/$src/Library/Preferences/com.apple.dock.plist /Users/$dest/Library/Preferences/com.apple.dock.plist

echo メールアカウントをコピーします・・
echo "$passwd" | sudo -s rsync -a /Users/$src/Library/Accounts/ /Users/$dest/Library/Accounts
echo "$passwd" | sudo -s chown -R $dest /Users/$dest/Library/Accounts