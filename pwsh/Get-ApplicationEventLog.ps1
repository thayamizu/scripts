<#
 # アプリケーションイベントのエラーログを取得します。
 #
 #>
Get-EventLog Application | Where-Object { $_.EntryType -eq "Error" }