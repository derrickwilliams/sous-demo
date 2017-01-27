# Sous Demo

This is an extremely simple app to serve a build-time chosen string to
demonstrate Sous deployment into a Singularity cluster.

## Try Me!

```
./open-demo.sh # works on Macs, echoes a URL for others
./set-version.sh 0.0.14 "MyFirstName" # use the next patch. No spaces in the quotes!
sous build
sous deploy
./open-demo.sh
