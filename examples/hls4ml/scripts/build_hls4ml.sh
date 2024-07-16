#!/bin/bash

cd $OPENCFR_HOME

mkdir build
cd build

cp $DART_HOME/scripts/partitioning-off_single_hls4ml.yaml .

$DART_HOME/bin/run_pr_tool_without_part_pynq partitioning-off_single_hls4ml.yaml