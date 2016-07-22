# teahub
Time estimations analyser hub for estimating milestones

## Goal

The goal of this project is two-fold
 * Get to know the basics of building a web application using Play, OAUTH, Forms, a persistence storage, some calls to external services and a frontend layer that displays everything.
 * Create an application that helps in making time-estimates and get better at making estimates.

A bit of background is given in this presentation: https://docs.google.com/presentation/d/1vK29T-FL5GnhPLi7LcrU3Zaam1z7VaWH_o65UlhDM7Q/edit#slide=id.gc6f980f91_0_0

## Basic functionalities
It’s not the intention to solve all problems related to estimation with this application, nor do we want to build a duplicate of Jira. The assumption is that you use Github Issues and Milestones. New issues are created under a backlog milestone with no specific end date. Issues can than later be added to a specific milestone that has an end date.

Main functionalities:
- Display issues of the github projects you are participating in, with labels and assignment
- Add time estimates to issues as days (d), weeks (w) or hours (h)
- Add actual time spent on issues
- Calculate overall time of open issues for a milestone
- Add availability of developers per week
- Display interesting statistics


## Components

### Server
On the server side it will be a Play 2.5 application. Preferably with compile-time dependency injection. See this [tutorial] (https://lunatech.atlassian.net/wiki/display/PRF/Play+Framework+-+Beginner+Tutorial+-+Make+a+post+request+and+save+the+form+data+in+Mongodb) from Harry for a start

### Frontend
HTML / JS / CSS - to be decided. You can use Play templates + Bootstrap, but could also try out React, Angular, Elm, Purescript, ScalaJs or anything else fancy that makes you happy. [Scalatags] (http://www.lihaoyi.com/scalatags/) could also be interesting to checkout

### Persistence
Database - to be decided. The simplest solutions that meets the needs. Redis, Postgresql or Postgress Json seem good candidates to me

### Authorisation
Authorisation - Github OAUTH authorisation. The first implementation is based on a Activator template from Dean Wampler, But if more OAUTH providers are needed something like [silhouette](http://silhouette.mohiva.com/) can be used

### VCS
Github, might be interesting to see if Gitlab has similar features

### Deployment
Possible solutions are: 
- Clever Cloud
- Docker
- AWS

### CI pipeline
To be decided

### Testing
The application should have good test coverage


## Tooling
Besides testing new frameworks it's also an opportunity to test new tooling that helps in writing clean code. How to integrate these tools and create a nice workflow. 

- Codacy (code coverage)
- Scalafmt (code formatting)

## Manual for developers
	Scala version: 2.11.8
	Current database: PostgreSQL 9.4
	SBT version: 0.13.11
	Play Framework version: 2.5

### Initial configurations
The configuration of the project goes under conf/application.conf

    Right now, we are using PostgreSQL, and you should change the properties 'url', 'user' and 'password' according to the configuration of your local database

The properties 'client.id' and 'client.secret' should be changed sometime according with the tokens generated from GitHub, but right now those should work.

### Brief explanation of chaos
- /app/controllers & app/util:

	controllers/Application.scala is not the real controller: the one that handles everything is util/OAuth2.scala

- /app/models:

	DBModels.scala is the model that represents the information we get from the DDBB. JSONModels.scala parses the JSON we get from the GitHub API into our own model

- app/views:

	index.scala.html and main.scala.html are only used for the initial page, the one where we ask for login information to the user. The important one is repository.scala.html

- /conf/evolutions/default:

	Here is where the scripts for the DDBB go. The only file inside this folder won't be useful by itself, since the IDs of the issues are personal (José) and were used only for tests. It can be used as a template.

