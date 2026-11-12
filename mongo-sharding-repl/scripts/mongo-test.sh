docker compose exec -T mongo_shard1-1 mongosh --port 27018<<EOF
rs.status()
use somedb;
db.helloDoc.countDocuments();
EOF

docker compose exec -T mongo_shard2-1 mongosh --port 27019<<EOF
rs.status()
use somedb;
db.helloDoc.countDocuments();
EOF

docker compose exec -T mongo_router mongosh --port 27020<<EOF
use somedb;
db.helloDoc.countDocuments();
EOF