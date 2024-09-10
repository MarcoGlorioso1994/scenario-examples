# Run 'docker run my-node node -e "console.log(1+1)"' and get a 2, if not return 1

if [ "$(docker run my-node node -e "console.log(1+1)")" == "2" ]; then
  exit 0
else
  exit 1
fi