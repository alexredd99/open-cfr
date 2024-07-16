#!/bin/bash

tar -xvf $OPENCFR_HOME/examples/hls4ml/hls4ml_acc/hw.tar.gz -C $DART_IP_PATH/
find $DART_IP_PATH/hls4ml_acc -name "*.tcl" -exec sed -i 's/solution1/solution_0/g' {} +
#find $DART_IP_PATH/hls4ml_acc -name "*.tcl" -exec sed -i 's/{project_name}_prj/{project_name}/g' {} +
ln -s $DART_IP_PATH/hls4ml_acc/hw/myproject_prj $DART_IP_PATH/hls4ml_acc/hw/hls4ml_acc
cd $DART_IP_PATH/hls4ml_acc/hw
vivado_hls -f build_prj.tcl "csim=0 cosim=0 export=1" 