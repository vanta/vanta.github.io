#!/bin/bash

taskId=`./recaptcha_create.sh`
./recaptcha_wait.sh $taskId
