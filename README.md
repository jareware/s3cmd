# jareware/s3cmd

Docker-wrapper for the ever-so-useful `s3cmd`, with proper tags, convenient entrypoint, and two special locations within the container:

 * `/config`, from which the `.s3cfg` is looked for by default. Use `-v` to mount your own, secret config over that.
 * `/data`, which is the default workdir. Use `-v` to mount any data you wish to operate on there.

## Usage

Running the container without arguments gives you the `--help`:

```
$ docker run jareware/s3cmd
Usage: s3cmd [options] COMMAND [parameters]

...
```

For operations that require authentication, mount your `~/.s3cfg` to the container:

```
$ docker run -v ~/.s3cfg:/config:ro jareware/s3cmd ls
2015-07-24 20:37  s3://my-bucket
2015-12-26 12:49  s3://another-bucket
```

All commands and arguments work as they would on the unwrapped `s3cmd`. Say you have `important.txt` at your current directory, which you'd want to upload to a publicly available location:

```
$ docker run -v ~/.s3cfg:/config:ro -v $(pwd):/data:ro jareware/s3cmd put --acl-public important.txt s3://my-bucket
```

## Versioning

The tags match the wrapped `s3cmd` release.

## License

MIT
