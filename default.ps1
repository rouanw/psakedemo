properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $cleanMessage = 'Executed Clean!'
}

task default -depends Test

task Test -depends Compile {
  MsTest /TestContainer:BuildApp.Tests/bin/Debug/BuildApp.Tests.dll /detail:errormessage
  Exec { Scripts/RunPesterSpecs.ps1 }
}

task Compile {
  MsBuild BuildApp.sln /verbosity:minimal
  $compileMessage
}

task Clean {
  MsBuild BuildApp.sln /target:Clean
  $cleanMessage
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
