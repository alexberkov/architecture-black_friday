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

docker compose exec -T mongo_shard1-1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1-rs",
      members: [
        { _id : 0, host : "mongo_shard1-1:27018" },
        { _id : 1, host : "mongo_shard1-2:27018" },
        { _id : 2, host : "mongo_shard1-3:27018" }
      ]
    }
);
EOF

docker compose exec -T mongo_shard2-1 mongosh --port 27019 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2-rs",
      members: [
        { _id : 0, host : "mongo_shard2-1:27019" },
        { _id : 1, host : "mongo_shard2-2:27019" },
        { _id : 2, host : "mongo_shard2-3:27019" }
      ]
    }
);
EOF