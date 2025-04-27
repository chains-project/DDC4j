# DDC on RHEL

This DDC is to reproduce Temurins release of OpenJDK21 and perform DDC on it.

## Setup

### GCC DevKit

The script assumes that you have followed the reproduction instructions by Adoptium (available [on adoptium.net](https://adoptium.net/docs/reproducible-verification-builds/reproduce-linux-x64/)) and built the GCC DevKit in the folder `/home/ddc4j/temurin_build/jdk21u/build/devkit/result/x86_64-linux-gnu-to-x86_64-linux-gnu`.

### Bootstrapped JDK

Extract a bootstrapped JDK 19 from GUIX using `guix pack openjdk@19.0.2:jdk --no-substitutes` and expand the tarball on your RHEL machine to `/gnu`. If you got a different hash you might need to update the paths in `ddc.sh`.

## Performing the DDC

You can then run `ddc.sh` to automatically download the source code and grand parent compilers neccessary, and perform the DDC.

