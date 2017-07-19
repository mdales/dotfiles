# from http://stackoverflow.com/questions/31083855/simulating-ls-in-powershell#31085072
function Format-WideColMajor {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [AllowNull()]
        [AllowEmptyString()]
        [PSObject]
        $InputObject,

        [Parameter()]
        $Property
    )

    begin {
        $list = new-object System.Collections.Generic.List[PSObject]
    }

    process {
        $list.Add($InputObject)
    }

    end {
        if ($Property) {
            $output = $list | Foreach {"$($_.$Property)"}
        }
        else {
            $output = $list | Foreach {"$_"}
        }

        $conWidth = $Host.UI.RawUI.BufferSize.Width - 1
        $maxLen = ($output | Measure-Object -Property Length -Maximum).Maximum

        $colWidth = $maxLen + 1

        $numCols = [Math]::Floor($conWidth / $colWidth)
        $numRows = [Math]::Ceiling($output.Count / $numCols)

        for ($i=0; $i -lt $numRows; $i++) {
            $line = ""
            for ($j = 0; $j -lt $numCols; $j++) {
                $item = $output[$i + ($j * $numRows)]
                $line += "$item$(' ' * ($colWidth - $item.Length))"
            }
            $line
        }
    }
}

New-Alias -Name grep -Description grep Select-String
New-Alias -Name open -Description open Start-Process
New-Alias -Name less -Description less More
New-Alias -Name pbcopy -Description pbcopy Set-Clipboard
New-Alias -name pbpaste -Description pbpaste Get-Clipboard


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

Function fi
{
    $filter = $args[0]
    Get-ChildItem -Recurse -Filter $filter
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

function md5
{
    Get-FileHash -a md5 $args | foreach { $_.Hash.toLower() }
}

function sha1
{
    Get-FileHash -a sha1 $args | foreach { $_.Hash.toLower() }
}

function sha256
{
    Get-FileHash -a sha256 $args | foreach { $_.Hash.toLower() }
}

function fi
{
    Get-ChildItem -R -Fi $args[0] | foreach { $_.DirectoryName + "\" + $_.ToString() }
}

function which
{
    Get-Command -all $args[0] | foreach { if ($_.CommandType -eq "Application") { $_.Source } elseif ($_.CommandType -eq "Alias") { $_.DisplayName } else { $_.CommandType } }
}

del alias:ls -Force
function ls
{
    Param([switch]$l,[switch]$a)

    Get-ChildItem $args | foreach { if ($l.IsPresent) { $_ } else {$_.ToString()} } | Format-WideColMajor
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
