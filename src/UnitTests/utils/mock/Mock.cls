Class UnitTests.utils.mock.Mock Extends %RegisteredObject
{

Property Methods As %ArrayOfObjects;

Method %DispatchMethod(Method As %String, Args...)
{
  Set dispatcher = ##class(UnitTests.utils.mock.MockDispatcher).%New()
  If (..Methods.IsDefined(Method)) {
    Merge dispatcher.Data = ..Methods.GetAt(Method).Data
  }
  Set dispatcher.Data("ClassName") = ..%ClassName(1)
  Set dispatchInfo = dispatcher.DispatchMethod(Method, Args...)
  If (dispatchInfo.%IsDefined("returnValue")) {
    Set returnValue = dispatchInfo."returnValue"
  }
  Kill dispatcher

  Return:($Data(returnValue)) returnValue
}

Method MockMethod(pMethodName As %String) As UnitTests.utils.mock.MethodMockBuilder
{
  Set entry = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Set mock = entry.MethodName(pMethodName)
  Do ..Methods.SetAt(mock, pMethodName)
  Return mock
}

ClassMethod Teste() As %Status
{
  Set mock = ##class(UnitTests.utils.mock.Mock).%New()
  
  Write "-- procedure no mocked",!
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Try {
    Do mock.NoMocked(, , .p)
  }
  Catch(e) {
    Write e.DisplayString(),!
  }

  Write "-- procedure mock",!
  Kill p
  Set o = mock.MockMethod("Teste1")
  Set o = o.ParameterOutputValue(3, "teste1")
  Do mock.Teste1(, , .p)
  ZWrite p

  Write "-- function mock",!
  Kill p
  Set o = mock.MockMethod("Teste2")
  Set o = o.ParameterOutputValue(3, "teste2")
  Set o = o.MethodReturnValue(2)
  Write mock.Teste2(, .p),!
  ZWrite p

  Write "-- object output parameter mock",!
  Kill p
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Set o = o.MethodName("Teste3")
  Set o = o.ParameterOutputValue(1, { "xecute": (##Quote(Set o = ##class(%ZEN.proxyObject).%New() Set o.status = "ok" Return o)) } )
  Do o.Teste3(.p)
  ZWrite p

  Write !,!,!
  Set serviceMock = ##class(UnitTests.utils.mock.Mock).%New()
  Do serviceMock.MockMethod("HL7MessageImportFromFile").ParameterOutputValue(2, { "xecute": (##Quote(Return ##class(%Exception.General).%New().AsStatus())) } ).MethodReturnValue("")
	#Define businessServiceMock ##Quote(Return ##class(UnitTests.utils.mock.Mock).%New().MockMethod("ProcessInput").ParameterOutputValue(2, 1).MethodReturnValue(1))
  Do serviceMock.MockMethod("EnsDirectorCreateBusinessService").ParameterOutputValue(2, { "xecute": ($$$businessServiceMock) } ).MethodReturnValue(1)
  Set msg = serviceMock.HL7MessageImportFromFile("", .status)
  ZWrite status,msg
  Set status = serviceMock.EnsDirectorCreateBusinessService("", .service)
  ZWrite status,service
}

}
