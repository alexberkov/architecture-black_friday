# pymongo-api

## Как запустить

Запускаем mongodb (с шардированием и репликами) и приложение

```shell
docker compose up -d
```

Настраиваем конфиг-сервер, шарды и роутер, заполняем mongodb данными

```shell
./scripts/mongo-init.sh

./scripts/mongo-init-router.sh
```

## Как проверить

Запускаем, смотрим кол-во реплик и документов на каждом из шардов и общее кол-во документов

```shell
./scripts/mongo-test.sh
```

