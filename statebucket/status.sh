#/bin/bash

### Applocation health check
cmd=`/root/project/terraform show |grep ecsloadbalancer|grep dns_name|awk '{print $3}'|cut -d'"' -f 2`
res=`curl -s $cmd/healthcheck/`
resp="OK"
if [[ $res == $resp ]]
then
   echo "App Responding Ok!!!!!!"
else
   exit 1
fi
