<#
 # システムイベントのエラーログを取得します。
 #
 #>
Get-EventLog System | Where-Object {$_.EntryType -eq "Error" }