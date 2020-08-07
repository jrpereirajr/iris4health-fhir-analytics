Class community.fhirAnalytics.samples.Setup Extends %RegisteredObject
{

ClassMethod SetupSampleFHIRProduction() As %Status
{
  zn "HSLIB"
  Set appKey = "/fhiranalytics/fhir/r4"
  Set strategyClass = "HS.FHIRServer.Storage.Json.InteractionsStrategy"
  Set metadataConfigKey = "HL7v40"
  Set namespace = "FHIRANALYTICS"
  Set classImportDir = "/tmp/deps/src"

  //Install a Foundation namespace and change to it
  Set pVars("Production") = "community.fhirAnalytics.samples.SampleFHIRProductionDefinition"
  Do ##class(HS.HC.Util.Installer).InstallFoundation(namespace, .pVars)
  zn namespace 

  // Install elements that are required for a FHIR-enabled namespace
  Do ##class(HS.FHIRServer.Installer).InstallNamespace()

  // Install an instance of a FHIR Service into the current namespace
  Do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataConfigKey)
  do ##class(Ens.Director).StopProduction()
  do $system.OBJ.ImportDir(classImportDir, "*.cls", "cdk", .errors, 1)

  zw $classmethod("Ens.Director", "SetAutoStart", "community.fhirAnalytics.samples.SampleFHIRProductionDefinition", 0)

  set cspConfig = ##class(HS.Util.RESTCSPConfig).URLIndexOpen(appKey)
  set cspConfig.ServiceConfigName = "HS.FHIRServer.Interop.Service"
  set cspConfig.AllowUnauthenticatedAccess = 1
  zw cspConfig.%Save()

  set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey)
  set config = strategy.GetServiceConfigData()
  set config.DebugMode = 4
  do strategy.SaveServiceConfigData(config)

  zn "%SYS"
  set props("NameSpace") = namespace
  set props("DispatchClass") = "community.fhirAnalytics.samples.Dispatch"
  set props("CookiePath") = "/csp/demo/rest/"
  set props("Description") = "Demo REST API"
  set props("MatchRoles") = ":%All"
  set props("AutheEnabled") = 64
  set tSC = ##class(Security.Applications).Create("/csp/demo/rest", .props)
  zw tSCs
}

ClassMethod InstallZPM()
{
  Set status = $$$OK
  Set origin = $ZNspace
  Try {
    // Install ZPM (https://community.intersystems.com/post/introducing-intersystems-objectscript-package-manager)
    ZNspace "FHIRANALYTICS"
    $$$THROWONERROR(st, $System.OBJ.Load("/tmp/deps/zpm.xml", "ck"))
    ZNspace origin
  }
  Catch(e) {
    ZNspace origin
    Throw e
  }
}

ClassMethod InstallFHIRAnalytics()
{
  Set status = $$$OK
  Set origin = $ZNspace
  Try {
    // Install fhiranalytics via ZPM
    ZNspace "FHIRANALYTICS"
    ZPM "load /tmp/deps/"
    ZNspace origin
  }
  Catch(e) {
    ZNspace origin
    Throw e
  }
}

ClassMethod InstallDSW()
{
  Set status = $$$OK
  Set origin = $ZNspace
  Try {
    // Install DSW via ZPM
    ZNspace "FHIRANALYTICS"
    ZPM "install dsw"
    ZNspace origin
  }
  Catch(e) {
    ZNspace origin
    Throw e
  }
}

ClassMethod PopulateFHIRAnalytics()
{
  Set status = $$$OK
  Set origin = $ZNspace
  Try {
    // Populating...
    ZNspace "FHIRANALYTICS"
    Do ##class(community.fhirAnalytics.samples.Populate).Run("/shared/samples/")
    ZNspace origin
  }
  Catch(e) {
    ZNspace origin
    Throw e
  }
}

ClassMethod Run()
{
  Write !, "Installing sample FHIR production..."
  Do ..SetupSampleFHIRProduction()
  Write !, "Ok!"

  Write !, "Installing ZPM..."
  Do ..InstallZPM()
  Write !, "Ok!"

  Write !, "Installing FHIR Analytics..."
  Do ..InstallFHIRAnalytics()
  Write !, "OK!"

  Write !, "Installing DeepSeeWeb..."
  Do ..InstallDSW()
  Write !, "OK!"

  #; Write !, "Populating..."
  #; Do ..PopulateFHIRAnalytics()
  #; Write !, "Ok!"
}

}
