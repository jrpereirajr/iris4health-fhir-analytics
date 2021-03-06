Class community.fhirAnalytics.deepsee.Container Extends %DeepSee.UserLibrary.Container
{

XData Contents [ XMLNamespace = "http://www.intersystems.com/deepsee/library" ]
{
<items>
  <!-- -->
  <pivot xmlns="http://www.intersystems.com/deepsee/library" name="Patients" folderName="User" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2020-07-26T17:47:47.964Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="PATIENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
    <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="[Address].[H1].[addressState].Members^[Address].[H1].[addressCity].Members" enabled="true">
    </rowAxisOptions>
    <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
    </columnAxisOptions>
    <rowLevel spec="[Address].[H1].[addressCountry].Members" key="" value="" text="Country" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
    </rowLevel>
    <sqlRestriction></sqlRestriction>
    <measure spec="[Measures].[%COUNT]" key="" value="" text="Count" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
    </measure>
  </pivot>
  
  <!-- -->
  <dashboard xmlns="http://www.intersystems.com/deepsee/library" name="Patient" folderName="User" title="Patient" description="" keywords="" owner="" shared="true" public="true" locked="false" resource="" timeCreated="2020-07-26T20:51:05.886Z" createdBy="SuperUser" category="" bookCover="" scheme="" worklistCount="2" snapTo="true" snapGrid="true" gridRows="10" gridCols="10" canResize="true" canModify="true" showTitleBar="true" titleBarOpacity="" titleBarColor="" selectedTitleBarOpacity="" selectedTitleBarColor="" titleBarTextColor="" selectedTitleBarTextColor="" titleBarFont="" companyName="" companyLogo="" companyStyle="" backgroundColor="white" backgroundImage="none" backgroundRepeat="no-repeat" backgroundSize="100% 100%" backgroundOpacity="1" widgetBorders="1px solid #F0F0F0" widgetBordersSwitch="edit" widgetBordersColor="#F0F0F0" widgetBordersStyle="solid" widgetBordersWidth="1" widgetBordersToggle="true">
    <widget name="Widget2" type="pivot" subtype="barChart" subtypeClass="barChart" title="" dataSource="User/Patients.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="3" homeColL="0" colSpanL="10" rowSpanL="7" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
      <dataProperty name="" label="$auto" width="" align="" subtype="" style="" display="" format="" showAs="" valueColumn="true" summary="" summaryValue="" dataValue="contagem" targetValue="" thresholdLower="" thresholdUpper="" rangeLower="" rangeUpper="" baseValue="" override=""></dataProperty>
      <property name="analyzer">0</property>
      <property name="drillDown">1</property>
    </widget>
    <widget name="Widget3" type="meter" subtype="textMeter" subtypeClass="" title="" dataSource="User/Patients.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="0" homeColL="0" colSpanL="4" rowSpanL="3" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
      <dataProperty name="" label="$auto" width="" align="" subtype="textMeter" style="" display="value" format="" showAs="value" valueColumn="false" summary="" summaryValue="" dataValue="contagem" targetValue="" thresholdLower="" thresholdUpper="" rangeLower="" rangeUpper="" baseValue="" override="{height:57,width:229,_type:&apos;textMeter&apos;}"></dataProperty>
      <property name="analyzer">0</property>
    </widget>
  </dashboard>
</items>
}

}
