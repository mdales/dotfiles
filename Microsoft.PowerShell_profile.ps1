New-Alias -Name grep -Description grep Select-String
New-Alias -Name open -Description open Start-Process

Function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

del alias:cd -Force
Function cd
{
	$target = $args[0]
	if ($target -eq $null) {
		$target = $home
	}
	Set-Location $target
}

Function prompt
{
    if( (
        New-Object Security.Principal.WindowsPrincipal (
            [Security.Principal.WindowsIdentity]::GetCurrent())
        ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
    {
    	$lead = "#"
    } else {
    	$lead = "%"
    }

	$hostname = hostname
	$dirname = [System.IO.Path]::GetFileName($PWD)
	if ($dirname -eq "") {
		$dirname = "/"
	}
	Write-Host $hostname  -nonewline -foregroundcolor darkgreen
	Write-Host "["  -nonewline -foregroundcolor yellow
	Write-Host $dirname  -nonewline -foregroundcolor yellow
	Write-Host "]"  -nonewline -foregroundcolor yellow
	Write-Host $lead -nonewline
	return " "
}

function branches 
{
    git branch --sort=-committerdate | Select-Object -First 20
}

Set-PSReadlineOption -TokenKind Keyword -ForegroundColor $Host.UI.RawUI.ForegroundColor -BackgroundColor $Host.UI.RawUI.BackgroundColor
Set-PSReadlineOption -TokenKind String -ForegroundColor $Host.UI.RawUI.ForegroundColor -BackgroundColor $Host.UI.RawUI.BackgroundColor
Set-PSReadlineOption -TokenKind Command -ForegroundColor $Host.UI.RawUI.ForegroundColor -BackgroundColor $Host.UI.RawUI.BackgroundColor
Set-PSReadlineOption -TokenKind Number -ForegroundColor $Host.UI.RawUI.ForegroundColor -BackgroundColor $Host.UI.RawUI.BackgroundColor
Set-PSReadlineOption -TokenKind Parameter -ForegroundColor $Host.UI.RawUI.ForegroundColor -BackgroundColor $Host.UI.RawUI.BackgroundColor

# Don't want to use emacs mode, as that nukes cut/copy/paste
Set-PSReadlineKeyHandler -Chord "Ctrl+a" -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord "Ctrl+e" -Function EndOfLine
Set-PSReadlineKeyHandler -Chord "Ctrl+k" -Function ForwardDeleteLine
Set-PSReadlineKeyHandler -Chord "Ctrl+l" -Function ClearScreen
Set-PSReadlineKeyHandler -Chord "Ctrl+w" -Function BackwardKillWord
