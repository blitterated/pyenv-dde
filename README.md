## Usage

### Build an image

The build takes a while. I use `pyenv` to get the latest python, and because I like to watch the build scroll by as I work.

Log files will be written to the `logs` directory.

#### Build image with the latest stable Python

Python 3

```sh
./build
```

Python 2

```sh
./build2
```

### Run the image

Python 3

```sh
docker run -it --rm pyenv-dde
```

Python 2

```sh
docker run -it --rm pyenv-pyv2-dde
```

__NOTE:__ if you try to run the above with `/bin/bash` appended, you'll get this error:

```text
/bin/bash: /bin/bash: cannot execute binary file
```

That's because this image is based on the [`dde`](https://github.com/blitterated/docker-dev-env/tree/master) image which has `/bin/bash` as its [`ENTRYPOINT`](https://github.com/blitterated/docker-dev-env/blob/master/Dockerfile#L16).
