Class UnitTests.community.fhirAnalytics.utils.TestDSTIME Extends (%UnitTest.TestCase, community.fhirAnalytics.utils.DSTIME)
{

Parameter NonExistingClass = "NonExistingClass";

Parameter ExistingClass = "ExistingClass";

Method TestInjectDSTIMEClassNotExists()
{
	Set tResults = $$$ISERR(..InjectDSTIME(..#NonExistingClass))
	Set tExpected = 1
	Do $$$AssertEquals(tResults, tExpected, "Should fail on non-existing class")
}

Method TestInjectDSTIMEClassExists()
{
	// test if delete previous class
	// test if create a new one
	// test if compile class
	Set tResults = ..InjectDSTIME(..#ExistingClass)
	zw tResults
	Set tExpected = 1
	Do $$$AssertEquals(tResults, tExpected, "Should successful change a existing class")
}

ClassMethod GetClassDefById(pClassName As %String, ByRef pStatus As %Status) As %ObjectHandle [ Private ]
{
	If (pClassName = ..#NonExistingClass) {
		Set pStatus = ##class(%Exception.General).%New().AsStatus()
		Return $$$NULLOREF
	}
  Return $$$OK
}

ClassMethod DeletePreviousParameterIfExists(pParameterId As %String) As %Status [ Private ]
{
  #; If (##class(%Dictionary.ParameterDefinition).%ExistsId(pParameterId)) {
  #;   Return ##class(%Dictionary.ParameterDefinition).%DeleteId(pParameterId)
  #; }
  Return $$$OK
}

ClassMethod CreateNewParameter(pParameterName As %String, pClassDef As %Dictionary.ClassDefinition) As %Status [ Private ]
{
  #; Set oParam = ##Class(%Dictionary.ParameterDefinition).%New()    
  #; Set oParam.Name = pParameterName
  #; Set oParam.parent = pClassDef
  #; Set oParam.Type = "STRING"
  #; Set oParam.Default = "AUTO"
  #; Return oParam.%Save()
	Return $$$OK
}

ClassMethod CompileClass(pClassName As %String) As %Status [ Private ]
{
  Return $$$OK
}

}
