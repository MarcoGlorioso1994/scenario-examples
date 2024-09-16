# Check that service `frontend-svc` has been created
# and that it has 3 endpoints

if kubectl get service frontend-svc &> /dev/null; then
  ENDPOINTS=$(kubectl get endpoints frontend-svc -o jsonpath='{.subsets[*].addresses[*].ip}')
  if [ $(echo $ENDPOINTS | wc -w) -eq 3 ]; then
    echo "done"
    exit 0
  else
    echo "The frontend-svc service should have 3 endpoints"
    exit 1
  fi
else
  echo "The frontend-svc service was not found"
  exit 1
fi