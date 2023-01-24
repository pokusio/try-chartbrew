## Let's try Chartbrew

## First dive


* 
```bash

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

## References

* https://github.com/chartbrew/chartbrew
* https://docs.chartbrew.com/#getting-started