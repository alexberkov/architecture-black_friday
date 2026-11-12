docker compose exec -T mongo_router mongosh --port 27020 --quiet <<EOF
sh.addShard("shard1-rs/mongo_shard1-1:27018,mongo_shard1-2:27018,mongo_shard1-3:27018");
sh.addShard("shard2-rs/mongo_shard2-1:27019,mongo_shard2-2:27019,mongo_shard2-3:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
EOF