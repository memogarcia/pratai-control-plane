# replace this by a proper orchestrator

# deploy elasticsearch
#TODO make this a cluster and add a volume and add config files
docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:1.7.5

# deploy nginx
# TODO add config file to add the hosts to balance, this image requires builing and rename nginx_custom to pratai-load-balancer
docker run  -P -d nginx_custom

# deploy pratai-api
# TODO deploy the api 3 times in the ports specified in the load balancer, we can add more ;)
# TODO build image from source everytime.
docker run 

# deploy the scheduler
