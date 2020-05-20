<#
 # CSVファイルから一括でActiveDirectoryユーザのパスワードを更新します。
 #
 #>
$filePath = Read-Host "パスワード更新用CSVファイルを入力してください。"
Import-Csv $filePath -Encoding UTF8 | % {
     # パラメータの取得
     $id=$_.'Name'
     $passwd=$_.'Password'
 
     # パスワード設定
     $user=Get-ADUser -Filter {name -eq $id}
     $user | Set-ADAccountPassword -NewPassword (ConvertTo-SecureString -AsPlainText $passwd -Force)
 
     # 結果を標準出力
     Write-Host "$id, $passwd"
     Write-Host "----"
 }
 