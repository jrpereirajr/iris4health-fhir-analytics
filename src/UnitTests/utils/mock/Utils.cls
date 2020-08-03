Class UnitTests.utils.mock.Utils Extends %RegisteredObject
{

ClassMethod GetExceptionLocation() As %String
{
    // Adapted from %Exception.General
  Try {
    For i=$ZUtil(41)-2:-1:1 Set pLocation=$Piece($ZUtil(41,i),"^",2,3) Quit:pLocation'="^"
    If pLocation="^" Set pLocation=""
  }
  Catch {
    Set pLocation = ""
  }
  Return pLocation
}

}
