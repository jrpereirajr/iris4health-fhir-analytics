/// 
Class community.fhirAnalytics.deepsee.cube.PatientCube Extends %DeepSee.CubeDefinition [ DependsOn = HSFHIR.I0001.S.Patient, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Patient" displayName="Patient" disabled="false" abstract="false" sourceClass="HSFHIR.I0001.S.Patient" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Address" disabled="false" hasAll="false" allCaption="All Address" allDisplayName="Address" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="addressCountry" disabled="false" sourceProperty="addressCountry" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="addressState" disabled="false" sourceProperty="addressState" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="addressCity" disabled="false" sourceProperty="addressCity" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}
