properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $packageMessage = 'Executed Package!'
  $cleanMessage = 'Executed Clean!'
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
	Exec { NuGet install BuildApp/packages.config -o packages }
	Exec { NuGet install BuildApp.Tests/packages.config -o packages }
	$packageMessage
}

task Clean {
  Exec { MsBuild BuildApp.sln /target:Clean }
  $cleanMessage
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
