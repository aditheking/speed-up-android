#!/bin/sh

# Copyright (C) 2015 Abhinav Jhanwar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

START=`date +%s`

stty -echo

echo "Running the process. This will take a minute."

while [ $(( $(date +%s) - 60 )) -lt $START ]
    do
	SPEED=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
	if [ ! -d "$SPEED" ]; then
	    mkdir -p $SPEED
	fi
    done
echo ""
echo "You are good to go."

sudo apt-get install xdg-utils

sleep 2

for ((i=1;i<=100;i++))
do
 xdg-open google.com 
done

echo "Done...."
