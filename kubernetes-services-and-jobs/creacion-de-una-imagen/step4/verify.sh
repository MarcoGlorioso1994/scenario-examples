# Run the container

docker run -d --rm --name verify -p 8888:8080 my-node-app
if ["$(docker exec verify curl -s -d ping localhost:8080)" == "pong"]; then
  exit 0
else
  exit 1
fi
docker rm -f verify
