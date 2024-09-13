# Verify that a k8s deployment called frontend has been created
# and it has 3 replicas running
if kubectl get deployment frontend &> /dev/null; then
  REPLICAS=$(kubectl get deployment frontend -o jsonpath='{.status.readyReplicas}')
  if [ "$REPLICAS" == "3" ]; then
    echo "done"
    exit 0
  else
    echo "The frontend deployment should have 3 replicas running"
    exit 1
  fi
else
  echo "The frontend deployment was not found"
  exit 1
fi