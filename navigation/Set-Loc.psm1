# .SYNOPSIS 
# Get the current home folder
# .LINK
# Set-Home
# Open-Home
function Get-Home {  return [System.Environment]::GetEnvironmentVariable("Home-Folder", "User") }

# .SYNOPSIS 
# Go to the home folder 
# .LINK
# Get-Home
# Set-Home
function Open-Home { if($homeLocation) { Set-Location $homeLocation } }

# .SYNOPSIS 
# Set the current location as the home folder
# .LINK
# Get-Home
# Open-Home
function Set-Home { 
	$homeLocation = Get-Location
	[System.Environment]::SetEnvironmentVariable("Home-Folder", $homeLocation, "User")
}

# .SYNOPSIS 
# Get the current home folder
# .LINK
# Set-Loc
# Open-Loc
function Get-Loc($locNum) {  return [System.Environment]::GetEnvironmentVariable("Home-Location$locNum", "User") }

# .SYNOPSIS 
# Go to the home folder 
# .LINK
# Get-Loc
# Set-Loc
function Open-Loc($locNum) { 
  $location = Get-Loc($locNum)
  Set-Location $location
}

# .SYNOPSIS 
# Set the current location as the home folder
# .LINK
# Get-Loc
# Open-Loc
function Set-Loc($locNum) { 
	$location = Get-Location
	[System.Environment]::SetEnvironmentVariable("Home-Location$locNum", $location, "User")
}

$homeLocation = Get-Home

Export-ModuleMember -Function * -Alias *