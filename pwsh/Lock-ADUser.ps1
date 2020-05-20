 <#
 # Active Directoryのユーザーのロックします
 #
 #>
$id=Read-Host "アカウントIDを入力してください"
Get-ADUser -Filter {name -eq $id} | Lock-ADAccount