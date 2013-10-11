properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $packageMessage = 'Executed Package!'
  $cleanMessage = 'Executed Clean!'
  if ($env:NuGet) { $NuGet = $env:NuGet } else { $NuGet = "NuGet" }
  if ($env:MsTest) { $MsTest = $env:MsTest } else { $MsTest = "MsTest" }
  if ($env:MsBuild) { $MsBuild = $env:MsBuild } else { $MsBuild = "MsBuild" }
}

task default -depends Test

task Test -depends Compile {
  Exec { Invoke-Expression "& '$MsTest' /TestContainer:BuildApp.Tests/bin/Debug/BuildApp.Tests.dll /detail:errormessage" }
  Exec { Scripts/RunPesterSpecs.ps1 }
}

task Compile -depends Package {
  Exec { Invoke-Expression "$MsBuild BuildApp.sln /verbosity:minimal" }
  $compileMessage
}

task Package {
	Exec { Invoke-Expression "$NuGet install BuildApp/packages.config -o packages" }
	Exec { Invoke-Expression "$NuGet install BuildApp.Tests/packages.config -o packages" }
	$packagesMessage
}

task Clean {
  Exec { Invoke-Expression "$MsBuild BuildApp.sln /target:Clean /verbosity:minimal" }
  $cleanMessage
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
