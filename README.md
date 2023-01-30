## Let's try Chartbrew

## First dive


* 
```bash
export DESIRED_VERSION="feature/first-try-for-fun"
# export CHARTBREW_HOME="~/.chartbrew.run/"
export CHARTBREW_HOME="~/.chartbrew/"
git clone git@github.com:pokusio/try-chartbrew.git "${CHARTBREW_HOME}"
cd "${CHARTBREW_HOME}"
git checkout "${DESIRED_VERSION}"
chmod +x ./*.sh
git pull && ./restart.sh && docker-compose logs -f
# ./run.sh
# ./restart.sh
# ./stop.sh

```

* Chartbrew : 

```bash
docker pull razvanilin/chartbrew

docker run -p 4019:4019 -p 4018:4018 \
  -e CB_SECRET=enter_a_secure_string \
  -e CB_API_HOST=0.0.0.0 \
  -e CB_API_PORT=4019 \
  -e CB_DB_HOST=host.docker.internal \
  -e CB_DB_PORT=3306 \
  -e CB_DB_NAME=chartbrew \
  -e CB_DB_USERNAME=root \
  -e CB_DB_PASSWORD=password \
  -e REACT_APP_CLIENT_HOST=http://localhost:4018 \
  -e REACT_APP_API_HOST=http://localhost:4019 \
  razvanilin/chartbrew
```


## Tests

### Testing running database

#### MySQL

```bash

git checkout *.* oci/tests/db/mysql/test1.sh && git pull && chmod +x ./*.sh && ./restart.sh

docker-compose exec -it chartbrew_db bash -c 'pwd && whoami'
docker-compose exec -it chartbrew_db bash -c 'pwd && mysql -D chartbrew_db -u chartbrewuser -p -e "SELECT 1 as TEST;" '

docker-compose exec -it chartbrew_db bash -c 'pwd && export MYSQL_PWD="chartbrewpwd" && mysql -D chartbrew_db -u chartbrewuser -e "SELECT 1 as TEST;" '

docker-compose cp ./oci/tests/db/mysql/test1.sh chartbrew_db:/root
docker-compose exec -it chartbrew_db bash -c 'pwd && ls -alh /root/test1.sh && chmod +x /root/test1.sh && /root/test1.sh'
docker-compose exec -it devops_net_probe bash -c 'pwd && apt-get update -y && apt-get install -y net-tools iputils-ping curl wget jq'



docker-compose exec -it devops_net_probe bash -c 'ping -c 4 chartbrew.pokus.io'
docker-compose exec -it devops_net_probe bash -c 'ping -c 4 chartbrew_api.pokus.io'
docker-compose exec -it devops_net_probe bash -c 'ping -c 4 chartbrew_db.pokus.io'
docker-compose exec -it devops_net_probe bash -c 'ping -c 4 postgres.pokus.io'

# --- --- #
# 
# Now we install mysql client to 
# try n connect from [devops_net_probe] container
# to mysql container, and execute a remote SELECT query
# 

```


## References

* https://github.com/chartbrew/chartbrew
* https://docs.chartbrew.com/#getting-started