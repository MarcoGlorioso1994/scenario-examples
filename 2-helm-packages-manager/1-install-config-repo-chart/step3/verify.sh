#!/bin/bash

helm list | grep "apache"

ls | grep "wordpress-"

helm get notes wordpress && helm get values wordpress && helm get manifest wordpress