<#
 # Active Directoryのユーザー一覧を取得します。
 #
 #>
$Path = Read-Host "取得先のDNを入力して下さい"
Get-ADUser -Filter { Enabled -eq "True"} -SearchBase "$Path"  | Export-Csv UserList.csv -Encoding Default