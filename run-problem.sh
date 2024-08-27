#!/usr/bin/env bash
args=$@
cs launch sbt -- "test:runMain problems.Launcher $args"
