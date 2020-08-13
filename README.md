# KKisilevsky_microservices
KKisilevsky microservices repository !

docker run -d --network=reddit --network-alias=db_post --network-alias=db_comment -v reddit_db:/data/db mongo:latest

docker run -d --network=reddit --network-alias=postik -e POST_DATABASE_HOST=db_post kkisilevsky/post:1.0

docker run -d --network=reddit --network-alias=commentik -e COMMENT_DATABASE_HOST=db_comment kkisilevsky/comment:1.0

docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=postik -e COMMENT_SERVICE_HOST=commentik kkisilevsky/ui:1.0
