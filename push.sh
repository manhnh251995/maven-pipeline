docker login -u manhnh1995 -p $REGISTRY_PASS
docker tag $IMAGE:$BUILD_TAG manhnh1995/$IMAGE:$BUILD_TAG-$BUILD_NUMBER
docker push manhnh1995/$IMAGE:$BUILD_TAG-$BUILD_NUMBER
