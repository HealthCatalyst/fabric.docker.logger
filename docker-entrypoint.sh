#!/bin/sh

echo 'starting docker-entrypoint.sh'

# Start the first process
# sh /opt/tomcat-nlp-nlpweb/bin/startup.sh run && echo 'ready'

# ./wait-for-it.sh localhost:8014 -- echo "web app is up"

# ./wait-for-it.sh localhost:8083 -- echo "web app is up"

# https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
# sed -i 's/original/new/g' file.txt

echo "Updating config"

/bin/sh /etc/nlp/nlpweb/updateconfig.sh

# echo 'shutting down tomcat'
# sh /opt/tomcat-nlp-nlpweb/bin/shutdown.sh

# echo 'finished shutting down'

# sleep 5s;

# echo 'finished sleeping'

wait-for-it mysqlserver:3306 -t 60 -- echo "mysql is up"

wait-for-it solrserver:8085 -t 60 -- echo "solr is up"

echo 'starting tomcat'

exec /opt/tomcat-nlp-nlpweb/bin/catalina.sh run