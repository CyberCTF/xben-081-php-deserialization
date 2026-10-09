#!/bin/sh
# A sign-in reaches MySQL and is refused (the database machine is reachable and seeded).
curl -fsS --max-time 20 -d 'username=nobody&password=probe' http://php/sign-in.php | grep -q 'Invalid username or password.'
