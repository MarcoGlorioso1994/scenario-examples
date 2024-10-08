#!/bin/bash

helm repo list | grep "bitnami"

helm get notes wordpress && helm get values wordpress && helm get manifest wordpress