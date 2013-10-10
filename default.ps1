properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $packageMessage = 'Executed Package!'
  $cleanMessage = 'Executed Clean!'
}

task default -depends Test

task Test -depends Compile {
  MsTest /TestContainer:BuildApp.Tests/bin/Debug/BuildApp.Tests.dll /detail:errormessage
  Exec { Scripts/RunPesterSpecs.ps1 }
}

task Compile -depends Package {
  MsBuild BuildApp.sln /verbosity:minimal
  $compileMessage
}

task Package {
	NuGet install BuildApp/packages.config -o packages
	NuGet install BuildApp.Tests/packages.config -o packages
	$packageMessage
}

task Clean {
  MsBuild BuildApp.sln /target:Clean
  $cleanMessage
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
