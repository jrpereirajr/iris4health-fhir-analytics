# iris4health-fhir-analytics

A set of IRIS Analytics resources built on IRIS for Health FHIR server.

## What's ready?

* A sample FHIR server setup on a IRIS for Health instance.
* A POC for:
  * Importing some sample data into FHIR database;
  * A simple cube, pivot table and dashboard for patientsusing IRIS Analytics (formerly known as DeepSee);
  * Create a cube manager.
  * [DeepSeeWeb](https://openexchange.intersystems.com/package/DeepSeeWeb): support

## What's coming soon?

* More dashboards

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

After ran population method, some data will be uploaded to FHIR database:

<img src="https://raw.githubusercontent.com/jrpereirajr/iris4health-fhir-analytics/master/img/Screenshot_36.png"></img>

A simple IRIS Analytics patient dashboard will also be availble in this URL:

*Credentials*:
 * Username: SuperUser
 * Password: password

```
http://localhost:52776/csp/healthshare/fhiranalytics/_DeepSee.UserPortal.DashboardViewer.zen?DASHBOARD=User/Patient.dashboard
```
<img src="https://raw.githubusercontent.com/jrpereirajr/iris4health-fhir-analytics/master/img/aJyxE9FPRy.gif"></img>

This same dashboard can be viewed using [DeepSeeWeb](https://openexchange.intersystems.com/package/DeepSeeWeb):

```
http://localhost:52776/dsw/index.html#!/d/User/Patient.dashboard?ns=FHIRANALYTICS
```
<img src="https://raw.githubusercontent.com/jrpereirajr/iris4health-fhir-analytics/master/img/dXUitKM9JJ.gif"></img>

## Special thanks

* https://github.com/grongierisc/FHIR-HL7v2-SQL-Demo.git for IRIS for Health FHIR setup!