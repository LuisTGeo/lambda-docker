
echo "----docker variables----"
container_name=lambda_docker
# docker_image=aws_lambda_builder_image

echo "----Running docker----"

echo "Creating image"
docker build . -t container_name

echo "----Container Running docker image----"
docker run -d container_name

echo "---- Copy requirements inside docker container ----"
docker cp ./requirements.txt $container_name:/

echo "---- running ./docker_install.sh inside docker  ----"
docker exec -i $container_name /bin/bash < ./docker_install.sh

echo "---- copy zip package from the container to outside  ----"
docker cp $container_name:/venv/lib/python3.8/deployment_package.zip deployment_package.zip

echo " "
docker stop %container_name
docker rm %container_name

zip -g deployment_package.zip lambda_function.py
