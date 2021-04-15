# docker-terraform

## terraform v0.14.10

### Local Build
```shell
docker build -t "terraform:0.14-local" --build-arg TERRAFORM_VER="0.14.10" --build-arg TERRAGRUNT="0.28.21" .
```

### Release

#### 
```shell
git tag 0.14-alpine-[ver]
git push --tags
```