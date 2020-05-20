<#
 # 対象アカウントのパスワードを更新します。
 #
 #>
# Load Assembly
 Add-Type -AssemblyName "System.Web"

# 社員番号の取得
$id=Read-Host "アカウントIDを入力してください"

# パスワード生成
$length=12 #桁数
$passwd=[System.Web.Security.Membership]::GeneratePassword($length, 0);

# パスワード設定
$user=Get-ADUser -Filter {name -eq $id}
$user | Set-ADAccountPassword -NewPassword (ConvertTo-SecureString -AsPlainText $passwd -Force)

# 結果を標準出力
Write-Output("$id, $passwd")