#Verify the Curl comand
if [ $(curl http://frontend-svc.default:80) ]; then
  exit 0
else
  exit 1
fi