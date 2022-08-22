# TPM2 CONTAINER

Script based in [deitch's swtpm-build](https://github.com/deitch/swtpm-build) to create the container with swtpm running.

It also install [tpm2-tools](https://github.com/tpm2-software/tpm2-tools) and [tpm2-tss](https://github.com/tpm2-software/tpm2-tss) into the container to allow interactions with swtpm.

## Dependencies

- [docker](https://docs.docker.com/engine/install/ubuntu/);

## How to run

To run this script execute the following commands in terminal:

```sh
docker build -t ${IMAGE_NAME} .
docker run -d ${IMAGE_NAME}
```

After running it, type `docker ps` into the terminal, it must return something like:

```sh
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS          PORTS                                           NAMES
8b602c6a3091   ${IMAGE_NAME}     "swtpm socket --tpms…"   7 seconds ago   Up 7 seconds                                                    nifty_lehmann
```

Then you can run: 

```sh
docker exec -it ${CONTAINER_ID} /bin/bash
```

Now you are in a terminal session inside the tpm2 container. To test it you can exec:

```sh
echo $(tpm2_getrandom 2 --hex)
```

If everything is running correctly, it must return a hexadecimal number. `EX.: fb9a`