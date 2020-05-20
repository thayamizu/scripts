<#
 # Active Directoryのユーザーのロックを解除します
 #
 #>
$id=Read-Host "アカウントIDを入力してください"
Get-ADUser -Filter {name -eq $id} | Unlock-ADAccount