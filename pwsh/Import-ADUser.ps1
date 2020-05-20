<#
 # CSVファイルからADユーザを一括登録します
 #
 #>

$domain = Read-Host "ドメイン名を入力してください"
$filePath   = Read-Host "CSVファイルパスを入力してください"
Import-Csv $filePath -Encoding UTF8 | % {
 
  Write-Host "次のユーザを作成します・・・"
  $staffCode = $_.'UserID'
  $password=(ConvertTo-SecureString -AsPlainText $_.'Password' -force) 
  $principal=$staffCode + "$domain"

  Write-Host ("ログインID:"+  $staffCode)
  Write-Host ("表示名:"+ $_.'DisplayName')
  Write-Host ("姓:" + $_.'SarName')
  Write-Host ("名:" + $_.'GivenName')
  Write-Host ("パス:" + $_.'Path')
  Write-Host ("プリンキパル:" + $principal)
  
  # ユーザー生成
  New-ADUser -Name $staffCode -DisplayName $_.'DisplayName' -GivenName $_.'GivenName' -Surname $_.'SarName' -Path $_.'Path' -Enabled $True -PasswordNeverExpires $True  -UserPrincipalName $principal -AccountPassword $password -EmailAddress $_.'Email' -Description $_.'DisplayName'

  #出力
  Write-Host "作成しました。"
  Write-Host "----"
}
