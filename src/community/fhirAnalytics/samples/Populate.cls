Class community.fhirAnalytics.samples.Populate Extends %RegisteredObject
{

ClassMethod Run(pSamplesDir As %String)
{
  Write !, "Importing samples files from ", pSamplesDir, "..."
  $$$THROWONERROR(st, ##class(community.fhirAnalytics.utils.ImportHL7Message).ImportDir(pSamplesDir))
  &SQL(SELECT COUNT(*) INTO :qtd FROM HSFHIR_I0001_S.Patient)
  Write !, "Patients: ", qtd
  Write !, "Ok!"

  Write !, "Building cubes..."
  $$$THROWONERROR(st, ##class(%DeepSee.CubeManager.Utils).BuildAllRegisteredGroups())
  Write !, "OK!"
}

}
