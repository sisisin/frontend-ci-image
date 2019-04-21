target=$1

case "$target" in
    "8")
        version="8.16.0"
        ;;
    "10")
        version="10.15.3"
        ;;
    *)
        echo "unsupported target"
        exit 1
        ;;
esac


IMAGE_ID=sisisin/frontend-ci-image:node-$version
echo $IMAGE_ID
docker build -t $IMAGE_ID "./node$target"
docker login
docker push $IMAGE_ID
