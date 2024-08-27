#!/usr/bin/env bash
#export  JVM_OPTS="-Dlog4j2.formatMsgNoLookups=true ${JVM_OPTS}"
args=$@
cs launch sbt -v --  "test:runMain examples.Launcher $args"
