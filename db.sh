#!/bin/bash

rake db:drop
echo "droped"
rake db:create
echo "created"

rake db:migrate
echo "migrated"
rake db:seed --trace
echo "seeded"

echo "completed"
