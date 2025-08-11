terraform init
terraform plan
terraform apply

./gradlew build
docker build -t springboot-demo .

docker tag springboot-demo <your-dockerhub-username>/springboot-demo:latest
docker push <your-dockerhub-username>/springboot-demo:latest

http://<instance-public-ip>:8080/hello