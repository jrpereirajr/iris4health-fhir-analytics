# iris4health-fhir-analytics

A set of IRIS Analytics resources built on IRIS for Health FHIR server.

## What's ready?

* A sample FHIR server setup on a IRIS for Health instance.
* A POC on creating a simple cube, a pivot table and a dashboard for patients stored by FHIR server, using IRIS Analytics (formerly known as DeepSee).

## What's coming soon?

* More dashboards
* DeepSeeWeb support

## Installing

Clone this repository

```
git clone https://github.com/jrpereirajr/iris4health-fhir-analytics.git
```

Build and up the docker container:

```
cd .\iris4health-fhir-analytics\
docker-compose build
docker-compose up -d
```

After instance is running, run theses commands in order to populate FHIR database:

```
docker exec -it iris4health-fhir-analytics_fhiranalytics_1 /bin/bash
irissession IRIS
ZNspace "FHIRANALYTICS"
Do ##class(community.fhirAnalytics.samples.Populate).Run("/shared/samples/")
```

*Note*: if such command fails, please, wait some time util FHIR production finish its statup. I'll try to improve this in next releases. :)

## Exploring

IRIS Analytics patient dashboard URL:

*Credentials*:
 * Username: SuperUser
 * Password: password

```
http://localhost:52776/csp/healthshare/fhiranalytics/_DeepSee.UserPortal.DashboardViewer.zen?DASHBOARD=User/Patient.dashboard
```

## Special thanks

* https://github.com/grongierisc/FHIR-HL7v2-SQL-Demo.git for IRIS for Health FHIR setup!