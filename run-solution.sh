#!/usr/bin/env bash
args=$@
cs launch sbt -- "test:runMain solutions.Launcher $args"
