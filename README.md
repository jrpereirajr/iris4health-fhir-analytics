# iris4health-fhir-analytics

A set of IRIS Analytics resources ready to use with IRIS for Health FHIR support.

## What's ready?

* A sample FHIR server setup on a IRIS for Health instance.
* A POC on creating a simple cube, a pivot table and a dashboard for patients stored by FHIR server, using IRIS Analytics (formerly known as DeepSee).

## Installing

Clone this repository

```
git clone https://github.com/jrpereirajr/iris4health-fhir-analytics.git
```

Build and up the docker container:

```
docker-compose build
docker-compose up -d
```

After instance is running, run theses commands in order to populate FHIR database:

```
ZNspace "FHIRANALYTICS"
Do ##class(community.fhirAnalytics.samples.Populate).Run("/shared/samples/")
```

After use, you can turn off the container:

```
docker-compose down
```

## Special thanks

* https://github.com/grongierisc/FHIR-HL7v2-SQL-Demo.git for IRIS for Health FHIR setup!