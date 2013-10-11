properties {
  if ($env:NuGet) { $NuGet = $env:NuGet } else { $NuGet = "NuGet" }
  if ($env:MsTest) { $MsTest = $env:MsTest } else { $MsTest = "MsTest" }
  if ($env:MsBuild) { $MsBuild = $env:MsBuild } else { $MsBuild = "MsBuild" }
}

task default -depends Test

task Test -depends Compile {
  Exec { Invoke-Expression "& '$MsTest' /TestContainer:BuildApp.Tests/bin/Release/BuildApp.Tests.dll /detail:errormessage" }
}

task Compile -depends Package {
  Exec { Invoke-Expression "$MsBuild BuildApp.sln /verbosity:minimal /p:Configuration=Release /p:OutputPath=bin\Release" }
}

task Package {
	Exec { Invoke-Expression "$NuGet install BuildApp/packages.config -o packages" }
	Exec { Invoke-Expression "$NuGet install BuildApp.Tests/packages.config -o packages" }
}

task Clean {
  Exec { Invoke-Expression "$MsBuild BuildApp.sln /target:Clean /verbosity:minimal" }
}

task ? -Description "Helper to display task info" {
        Write-Documentation
}
