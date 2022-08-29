# SCP Secret Laboratory

## Build notes
To catch updates since the original image was built, run:

 ```
docker build --build-arg CACHE_DATE="$(date)"
```

This will re-use the previously built image as a base instead of re-downloading everything again.

## Environment variables

