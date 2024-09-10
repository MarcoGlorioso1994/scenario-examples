if [ $(kubectl get svc | grep frontend-svc) -eq 0 ]; then
  exit 0
else
  exit 1
fi