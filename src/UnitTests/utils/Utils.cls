Class UnitTests.utils.Util Extends %RegisteredObject
{

ClassMethod Run()
{
  Set ^UnitTestRoot="/tmp/"
  Do $SYSTEM.OBJ.ExportPackage("UnitTests","/tmp/ut/UnitTests.xml")
  Do ##class(%UnitTest.Manager).RunTest("ut", "/nodelete")
}

}
