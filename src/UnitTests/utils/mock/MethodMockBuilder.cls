Class UnitTests.utils.mock.MethodMockBuilder Extends %RegisteredObject
{

Property Data [ MultiDimensional ];

Method MethodName(pMethodName As %String) As UnitTests.utils.mock.MethodMockBuilder
{
  Set ..Data("MethodName") = pMethodName
  Return $This
}

Method MethodReturnValue(pReturnValue) As UnitTests.utils.mock.MethodMockBuilder
{
  Set ..Data("MethodReturnValue") = pReturnValue
  Return $This
}

Method ParameterOutputValue(pParamIndex As %Integer, pParamValue) As UnitTests.utils.mock.MethodMockBuilder
{
  If ($IsObject(pParamValue)) {
    If (pParamValue.%IsA("%Library.DynamicObject")) {
      Set ..Data("ParameterOutputValue", pParamIndex, "value") = pParamValue.%ToJSON()
      Set ..Data("ParameterOutputValue", pParamIndex, "type") = pParamValue.%ClassName(1)
    }
  }
  Else {
    Set ..Data("ParameterOutputValue", pParamIndex, "value") = pParamValue
    Set ..Data("ParameterOutputValue", pParamIndex, "type") = "primitive"
  }
  Return $This
}

Method %DispatchMethod(Method As %String, Args...)
{
  Set dispatcher = ##class(UnitTests.utils.mock.MockDispatcher).%New()
  Merge dispatcher.Data = ..Data
  Set dispatcher.Data("ClassName") = ..%ClassName(1)
  Set dispatchInfo = dispatcher.DispatchMethod(Method, Args...)
  If (dispatchInfo.%IsDefined("returnValue")) {
    Set returnValue = dispatchInfo."returnValue"
  }
  Return:($Data(returnValue)) returnValue
}

ClassMethod Teste() As %Status
{
  Write "-- procedure no mocked",!
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Try {
    Do o.NoMocked(, , .p)
  }
  Catch(e) {
    Write e.DisplayString(),!
  }
  
  Write "-- procedure mock",!
  Kill p
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Set o = o.MethodName("Teste1")
  Set o = o.ParameterOutputValue(3, "teste1")
  Do o.Teste1(, , .p)
  ZWrite p

  Write "-- function mock",!
  Kill p
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Set o = o.MethodName("Teste2")
  Set o = o.ParameterOutputValue(2, "teste2")
  Set o = o.MethodReturnValue(1)
  Write o.Teste2(, .p),!
  ZWrite p

  Write "-- object output parameter mock",!
  Kill p
  Set o = ##class(UnitTests.utils.mock.MethodMockBuilder).%New()
  Set o = o.MethodName("Teste3")
  #; Set o = o.ParameterOutputValue(3, {"xecute": (##Quote(Return ##class(%ZEN.proxyObject).%New()))})
  Set o = o.ParameterOutputValue(1, { "xecute": (##Quote(Set o = ##class(%ZEN.proxyObject).%New() Set o.status = "ok" Return o)) } )
  Do o.Teste3(.p)
  ZWrite p
}

}
