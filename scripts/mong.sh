#!/usr/bin/env bash

alias docker='podman'

podman run -d  -p 27017:27017 --name mongo1 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password   --network mongoCluster mongo  --replSet myReplicaSet --bind_ip localhost,mongo1

podman run -d  -p 27018:27017 --name mongo2 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password   --network mongoCluster mongo  --replSet myReplicaSet --bind_ip localhost,mongo2


podman run -d  -p 27019:27017 --name mongo3 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password   --network mongoCluster mongo  --replSet myReplicaSet --bind_ip localhost,mongo3

podman exec -it mongo1 mongo --eval "rs.initiate({
 _id: \"myReplicaSet\",
 members: [
   {_id: 0, host: \"mongo1\"},
   {_id: 1, host: \"mongo2\"},
   {_id: 2, host: \"mongo3\"}
 ]
})"
