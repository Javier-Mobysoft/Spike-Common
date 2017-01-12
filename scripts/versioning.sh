#!/bin/bash
commit_date=`git show -s --format="%ct"`
formatted_date=`date -d @${commit_date} +"%Y%m%d%H%M"`
incremental_version=`echo ${GO_PIPELINE_LABEL} | awk '{split($0,a,"."); print a[3]}'`
mvn versions:update-parent -DallowSnapshots=true
mvn versions:set -DnewVersion=${formatted_date}-${incremental_version}-SNAPSHOT  