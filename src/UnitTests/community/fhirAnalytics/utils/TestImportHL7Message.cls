Class UnitTests.community.fhirAnalytics.utils.TestImportHL7Message Extends %UnitTest.TestCase
{

Method TestShouldFailImportNonExistingFile()
{
	Set serviceMock = ##class(UnitTests.utils.mock.Mock).%New()
	Do serviceMock.MockMethod("HL7MessageImportFromFile").ParameterOutputValue(2, {"xecute": (##Quote(Return ##class(%Exception.General).%New().AsStatus()))}).MethodReturnValue("")
	#Define businessServiceMock ##Quote(Return ##class(UnitTests.utils.mock.Mock).%New().MockMethod("ProcessInput").ParameterOutputValue(2, 1).MethodReturnValue(1))
	Do serviceMock.MockMethod("EnsDirectorCreateBusinessService").ParameterOutputValue(2, {"xecute": ($$$businessServiceMock)}).MethodReturnValue(1)
	Set instance = ##class(community.fhirAnalytics.utils.ImportHL7Message).%New(serviceMock)

	Set tResults = $$$ISERR(instance.ImportFile(""))
	Set tExpected = 1
	Do $$$AssertEquals(tResults, tExpected, tResults_" = "_tExpected)
}

Method TestShouldImportExistingFile()
{
	Set serviceMock = ##class(UnitTests.utils.mock.Mock).%New()
	Do serviceMock.MockMethod("HL7MessageImportFromFile").ParameterOutputValue(2, 1).MethodReturnValue("")
	#Define businessServiceMock ##Quote(Return ##class(UnitTests.utils.mock.Mock).%New().MockMethod("ProcessInput").ParameterOutputValue(2, 1).MethodReturnValue(1))
	Do serviceMock.MockMethod("EnsDirectorCreateBusinessService").ParameterOutputValue(2, {"xecute": ($$$businessServiceMock)}).MethodReturnValue(1)
	Set instance = ##class(community.fhirAnalytics.utils.ImportHL7Message).%New(serviceMock)

	Set tResults = instance.ImportFile("")
	Set tExpected = 1
	Do $$$AssertEquals(tResults, tExpected, tResults_" = "_tExpected)
}

}
