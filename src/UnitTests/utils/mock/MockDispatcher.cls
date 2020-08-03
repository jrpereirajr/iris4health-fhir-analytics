Class UnitTests.utils.mock.MockDispatcher Extends %RegisteredObject
{

Property Data [ MultiDimensional ];

Method DispatchMethod(Method As %String, Args...) As %DynamicObject
{
  #; ZWrite Method, Args
  #; ZWrite $This

  Set dispatchInfo = {}

  If (Method = $Get(..Data("MethodName"))) {
    Set argIndex = $Order(..Data("ParameterOutputValue", ""))
    While (argIndex '= "") {
      Set paramValue = ..Data("ParameterOutputValue", argIndex, "value")
      Set paramType = ..Data("ParameterOutputValue", argIndex, "type")
      If (paramType '= "primitive") {
        Set paramConfig = {}.%FromJSON(paramValue)
        Set paramValue = $Xecute(paramConfig."xecute")
      }
      Set Args(argIndex) = paramValue
      Set argIndex = $Order(..Data("ParameterOutputValue", argIndex))
    }

    If ($Data(..Data("MethodReturnValue"))) {
      Set dispatchInfo."returnValue" = ..Data("MethodReturnValue")
    }
  }
  Else {
    Set exceptionName = "<METHOD DOES NOT EXIST>"
    Set location = ##class(UnitTests.utils.mock.Utils).GetExceptionLocation()
    Throw ##class(%Exception.SystemException).%New(exceptionName, exceptionName, location, Method_","_..Data("ClassName"))
  }

  Return dispatchInfo
}

}
