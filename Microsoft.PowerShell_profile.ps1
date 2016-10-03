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