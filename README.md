# DDC4j


Students: [Elias Lundell](https://eliaslundell.se), [Eskil Nyberg]() 

Supervisor: [Aman Sharma](https://algomaster99.github.io/),
Examiner: [Martin Monperrus](https://www.monperrus.net/martin)

---

A Degree Project, First Cycle, to perform Diverse Double-Compiling (DDC) for Java. The project implemented DDC for the javac compiler and used it to verify a release of the JDK: Temurin 21.0.5-ga. Note that, since there exists no truly trusted compiler in the Java ecosystem, this verification only supports the hypothesis that Temurin's release of the JDK is not infected by a trusting trust attack - it does not prove it.

The project's corresponding thesis is available at this link: [LINK TBA].

## Reproducing our work

If you are interested in reproducing our work, feel free to take a look at our implementations in Docker (for typical use-cases) or in Red Hat Enterprise Linux (RHEL) for the verification of Temurin.

* [Scripts for DDC in Docker on Ubuntu / GNU Guix Bootstrapping](/ddc_ubuntu/)
* [Scripts for DDC in RHEL](/ddc_rhel/)

## Related Work
* [Reflections on Trusting Trust](https://dl.acm.org/doi/pdf/10.1145/358198.358210?trk=public_post_comment-text)
* [Countering trusting trust through diverse double-compiling](http://ieeexplore.ieee.org/document/1565233/)
* [Diverse Double-Compiling to Harden Cryptocurrency Software (Master's thesis KTH 2023)](http://urn.kb.se/resolve?urn=urn:nbn:se:kth:diva-323901)
* [Improving Trust in Software through Diverse Double-Compiling and Reproducible Builds](https://www.duo.uio.no/handle/10852/65737)
* [Reflections on Rusting Trust](https://manishearth.github.io/blog/2016/12/02/reflections-on-rusting-trust/)

