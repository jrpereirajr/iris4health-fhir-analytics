Class community.fhirAnalytics.utils.ImportHL7Message Extends %RegisteredObject
{

Property services As community.fhirAnalytics.utils.ImportHL7MessageService;

Method %OnNew(services As community.fhirAnalytics.utils.ImportHL7MessageService = "") As %Status [ Private, ServerOnly = 1 ]
{
  Set:'$IsObject(services) ..services = ##class(community.fhirAnalytics.utils.ImportHL7MessageService).%New()
  Set:$IsObject(services) ..services = services
  Quit $$$OK
}

Method ImportFile(pFileName As %String, pBSName As %String = "WS_REST") As %Status
{
  Set status = $$$OK
  Try {
    Set bsName = pBSName
    Set msg = ..services.HL7MessageImportFromFile(pFileName, .status)
    $$$THROWONERROR(st, status)
    $$$ThrowOnError(..services.EnsDirectorCreateBusinessService(bsName, .service))
    $$$ThrowOnError(service.ProcessInput(msg, .output))
  }
  Catch(ex) {
    Set status = ex.AsStatus()
  }
  Return status
}

ClassMethod ImportDir(pDirectory As %String = "/shared/samples/") As %Status
{
  Set status = $$$OK
  Try {
    Set instance = ##class(community.fhirAnalytics.utils.ImportHL7Message).%New()
    Set rs = ##class(%ResultSet).%New()
    Set rs.ClassName = "%File"
    Set rs.QueryName = "FileSet"
    Set sc = rs.Execute(pDirectory)
    While rs.Next() {
      Set fileName = rs.Data("Name")
      $$$ThrowOnError(instance.ImportFile(fileName))
    }
  }
  Catch(e) {
    Set status = e.AsStatus()
  }
  Return status
}

}
