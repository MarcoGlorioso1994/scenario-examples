# Check that the file ./project/Dockerfile exists
if [ -f ./project/deployment.yaml ]; then
  if [ $(kubectl get deployment | grep frontend ) -eq 0 ]; then
    exit 0
  fi
else
  exit 1
fi