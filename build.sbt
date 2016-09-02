name := """TEAHub"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.8"

libraryDependencies ++= Seq(
  jdbc,
  cache,
  ws,
  evolutions,
  "org.postgresql" % "postgresql" % "9.4.1208",
  "joda-time" % "joda-time" % "2.9.4"
)
