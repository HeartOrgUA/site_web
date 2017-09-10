docker-compose stop
docker-compose rm -f
rm tmp/pids/server.pid
docker-compose up -d