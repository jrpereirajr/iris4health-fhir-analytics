#!/bin/bash

irissession $ISC_PACKAGE_INSTANCENAME -U USER <<EOF 
sys
sys
Do \$System.OBJ.Load("/tmp/deps/src/community/fhirAnalytics/samples/Setup.cls", "ck")
Do ##class(community.fhirAnalytics.samples.Setup).Run()
halt
EOF