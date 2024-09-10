# Check that the file ./project/Dockerfile exists
if [ -f ./project/Dockerfile ]; then
  exit 0
else
  exit 1
fi