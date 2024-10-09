#!/bin/bash

helm repo list | grep "bitnami"

helm search repo nginx-ingress-controller --version 9.9 -l | grep "nginx-ingress-controller"