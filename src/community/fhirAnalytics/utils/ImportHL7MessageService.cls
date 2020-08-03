Class community.fhirAnalytics.utils.ImportHL7MessageService Extends %RegisteredObject
{

Method HL7MessageImportFromFile(pFileName As %String, ByRef pStatus As %Status) As EnsLib.HL7.Message
{
  Return ##class(EnsLib.HL7.Message).ImportFromFile(pFileName, 1, .pStatus)
}

Method EnsDirectorCreateBusinessService(pTargetDispatchName As %String, Output pBusinessService As Ens.BusinessService) As %Status
{
  Return ##class(Ens.Director).CreateBusinessService(pTargetDispatchName, .pBusinessService)
}

}
