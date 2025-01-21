# Compilers

An overview of types and versions of compilers attempted so far in the project.

## Java SE Development Kit (Oracle)

|||
|-|-|
|Source code|Closed source|
|Binaries|https://www.oracle.com/java/technologies/downloads/|
|sdkman-id|oracle|

#### Dockerfiles and scripts

|OS|Dockerfile|Script|Result|
|-|-|-|-|
|Ubuntu|TBA|TBA|TBD|

## OpenJDK

|||
|-|-|
|Source code|https://github.com/openjdk/jdk|
|Other links|https://openjdk.org/groups/compiler/ https://openjdk.org/groups/compiler/doc/hhgtjavac/index.html https://openjdk.org/groups/compiler/doc/package-overview/index.html https://openjdk.org/groups/compiler/doc/compilation-overview/index.html|

### > OpenJDK (Microsoft)

|||
|-|-|
|Instructions|https://openjdk.org/groups/build/doc/building.html|
|Source code|https://github.com/microsoft/openjdk/blob/main/README.md (See README.md)|
|Binaries|https://learn.microsoft.com/en-us/java/openjdk/download|
|sdkman-id|ms|
|Other links|https://learn.microsoft.com/en-us/java/openjdk/overview|

#### Dockerfiles and scripts

|OS|Dockerfile|Script|Result|
|-|-|-|-|
|Ubuntu|TBA|TBA|TBD|

### > OpenJDK (jdk.java.net / Oracle)

|||
|-|-|
|Instructions|https://openjdk.org/groups/build/doc/building.html|
|Binaries|https://jdk.java.net/21/ \| https://jdk.java.net/archive/|
|sdkman-id|open|
|Other links|

#### Dockerfiles and scripts

|OS|Dockerfile|Script|Result|
|-|-|-|-|
|Ubuntu|TBA|TBA|TBD|

### > Temurin (Eclipse Adoptium)

|||
|-|-|
|Instructions|https://github.com/adoptium/temurin-build|
|Binaries|https://adoptium.net/temurin/releases/|
|sdkman-id|tem|
|Other links|https://adoptium.net/blog/2024/08/adoptium-reproducible-verification-builds/ https://adoptium.net/docs/reproducible-verification-builds/reproduce-linux-x64/|

#### Dockerfiles and scripts

|OS|Dockerfile|Script|Result|
|-|-|-|-|
|Ubuntu|[ubuntu/Dockerfile](./ubuntu/Dockerfile)|OpenJDK 21.0.5-tem (21.0.5-ga) [bootstrap-21.0.5-tem-with-21.0.5-tem.sh](./ubuntu/scripts/bootstrap-21.0.5-tem-with-21.0.5-tem.sh)|TBD|
|CentOS|TBA|TBA|TBD|

### > Template

|||
|-|-|
|Instructions|link1|
|Binaries|link2 link3|
|sdkman-id|tag|
|Other links|link4 link5|

#### Dockerfiles and scripts

|OS|Dockerfile|Script|Result|
|-|-|-|-|
|Ubuntu|[ubuntu/Dockerfile](./ubuntu/Dockerfile)|Release 0.0.0.0-tag (identifier) [script.sh](./scripts/os/script.sh)|TBD|

## Irrelevant compilers

* GraalVM compiles IR (Java byte code) to runnable machine code. However, GraalVM never has a hand in compiling itself (that we know of) and as such a trusting trust attack cannot occur in GraalVM. Since we do not have the source code of the Java SE Development Kit (that we think GraalVM uses) we cannot verify that there is no trusting trust in its javac. I guess we can verify that its distribution does not insert a trusting trust into OpenJDK's javac. // Eskil
* ...