## Usage

### Build an image

The build takes a while. I use `pyenv` to get the latest python, and because I like to watch the build scroll by as I work.

Log files will be written to the `build-logs` directory.

```sh
./build-with-log
```

### Run the image

```sh
docker run -it --rm --name pyenvdde pyenv-dde
```

__NOTE:__ if you try to run the above with `/bin/bash` appended, you'll get this error:

```text
/bin/bash: /bin/bash: cannot execute binary file
```

That's because this image is based on the [`dde`](https://github.com/blitterated/docker-dev-env/tree/master) image which has `/bin/bash` as its [`ENTRYPOINT`](https://github.com/blitterated/docker-dev-env/blob/master/Dockerfile#L16).

### Run a python

```sh
pyenv 3.1.2
python --version
```

``` text
python 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]
```

### Image size

The two stage build cuts the image size down from 1.3GB to 670MB.

It can be cut down further by flattening it:

```sh
CONT_ID=$(docker create pyenv-dde)
docker export $CONT_ID | docker import - pyenv-dde-flat
docker rm $CONT_ID
```

Results:

```text
docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
pyenv-dde-flat   latest    cfd1d5f201d6   4 seconds ago    563MB
pyenv-dde        latest    d7c8604f8a79   23 minutes ago   668MB
```
