properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $packageMessage = 'Executed Package!'
  $cleanMessage = 'Executed Clean!'
  if ($env:NuGet) { $NuGet = $env:NuGet } else { $NuGet = "NuGet" }
}

task default -depends Test

task Test -depends Compile {
  Exec { MsTest /TestContainer:BuildApp.Tests/bin/Debug/BuildApp.Tests.dll /detail:errormessage }
  Exec { Scripts/RunPesterSpecs.ps1 }
}

task Compile -depends Package {
  Exec { MsBuild BuildApp.sln /verbosity:minimal }
  $compileMessage
}

task Package {
	Exec { Invoke-Expression "$NuGet install BuildApp/packages.config -o packages" }
	Exec { Invoke-Expression "$NuGet install BuildApp.Tests/packages.config -o packages" }
	$packagesMessage
}

task Clean {
  Exec { MsBuild BuildApp.sln /target:Clean }
  $cleanMessage
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
