Class community.fhirAnalytics.samples.POSTService Extends EnsLib.HL7.Service.Standard
{

Parameter CONTENTTYPE = "text/xml";

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Property TargetConfigNames As %String(MAXLEN = 1000) [ InitialExpression = "HL7toSDAProcess" ];

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnProcessInput(pDocIn As %RegisteredObject, Output pDocOut As %RegisteredObject) As %Status
{
    Set status = $$$OK
    Set request = pDocIn

    Set request.DocType = ..resolveDocType(pDocIn)
    
    Try {
        //$$$ThrowOnError(..SendRequestSync(..#TARGET, request, .pDocOut))
        For iTarget=1:1:$Length(..TargetConfigNames, ",") {
            Set tOneTarget = $ZStrip($Piece(..TargetConfigNames, ",", iTarget), "<>W")
            Continue:("" = tOneTarget)
            $$$THROWONERROR(st, ..SendRequestSync(tOneTarget, request, .pDocOut))
        }
    }
    Catch ex {
        Set status = ex.AsStatus()
    }
    Quit status
}

/// Return an array of connections for drawing lines on the config diagram
ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
    Do ##super(.pArray,pItem)
    If pItem.GetModifiedSetting("TargetConfigNames",.tValue) {
        For i=1:1:$Length(tValue,",") { Set tOne=$ZStrip($Piece(tValue,",",i),"<>W")  Continue:""=tOne  Set pArray(tOne)="" }
    }
}

}
