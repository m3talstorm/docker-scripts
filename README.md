# docker-scripts

A handful of bash scripts for building/pushing/cleaning Docker images with a bit more feedback.

This is mainly for projects that use multiple Docker images (spun up with docker-compose normally), that have a standard format for their image names.

Such as ```Project-DB, Project-API, Project-GUI``` etc

```
git clone https://github.com/m3talstorm/docker-scripts.git
cd docker-scripts
bash scripts/docker-build.sh
```

Following the above example, edit docker-build and docker-push changing ```IMAGES="Image1 Image2 Image2"``` to ```IMAGES="DB API GUI"```

IF you are not using Gitlab as your registry you will need to edit that as well.

Note: The images are built in the order they appear in the list (to handle dependencies)

You can also build just a single image like so:

```
bash scripts/docker-build.sh GUI
```


### Output

```
bash scripts/docker-build.sh GUI
Building image: ele-Pathing
Sending build context to Docker daemon  29.18kB
Step 1/9 - 9/9:
Successfully built 6674678ec09a
Successfully tagged registry.gitlab.com/<your account>/<your repo>/project-gui:latest
Built image: project-GUI | Size: 100M | Duration: 2s
Built images
```
