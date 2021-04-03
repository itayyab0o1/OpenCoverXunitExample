
"SonarScanner.MSBuild.exe" begin /k:"masbuild.xunit" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="" /d:sonar.password="" /d:sonar.cs.xunit.reportsPaths="testlog.xml" /d:sonar.cs.opencover.reportsPaths="MyProject_coverage.xml"
"C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" CodecovProject.sln  /t:Rebuild

".\packages\OpenCover.4.7.922\tools\OpenCover.Console.exe" -register:user -target:".\packages\xunit.runner.console.2.4.1\tools\net452\xunit.console.x86.exe" -targetargs:".\MyUnitTests\bin\Debug\MyUnitTests.dll -noshadow -xml testlog.xml" -filter:"+[UnitTestTargetProject*]* -[MyUnitTests*]*" -output:".\MyProject_coverage.xml"

".\packages\ReportGenerator.1.9.1.0\ReportGenerator.exe" "-reports:MyProject_coverage.xml" "-targetdir:_CodeCoverageReport"

"SonarScanner.MSBuild.exe" end /d:sonar.login="" /d:sonar.password=""




@pause