$Path = "H:\test" #das ist der Pfad in dem gelöscht werden soll
$Daysback = "-30" #die Tage die rückwirkend gelöscht werden sollen

$CurrentDay = Get-Date #das aktuelle Datum
$DatetoDelete = $CurrentDay.AddDays($Daysback) #zusammen setzen der Variablen für das Löschen

Get-ChildItem $Path -Recurse | where {$_.LastWriteTime -lt $DatetoDelete -and -not $_.psiscontainer } |% { Remove-Item $_.FullName -Force} #Der Befehl zum Löschen
