#!/bin/bash

docker compose exec -T mongo_config_server mongosh --port 27017 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "mongo_config_server:27017" }
    ]
  }
);
EOF

docker compose exec -T mongo_shard1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "mongo_shard1:27018" }
      ]
    }
);
EOF

docker compose exec -T mongo_shard2 mongosh --port 27019 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "mongo_shard2:27019" }
      ]
    }
);
EOF