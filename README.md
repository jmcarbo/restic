[![Stories in Ready](https://badge.waffle.io/restic/restic.png?label=ready&title=Ready)](https://waffle.io/restic/restic)
[![Build Status](https://travis-ci.org/restic/restic.svg?branch=master)](https://travis-ci.org/restic/restic)
[![Build status](https://ci.appveyor.com/api/projects/status/nuy4lfbgfbytw92q/branch/master?svg=true)](https://ci.appveyor.com/project/fd0/restic/branch/master)
[![sourcegraph status](https://sourcegraph.com/api/repos/github.com/restic/restic/.badges/status.png)](https://sourcegraph.com/github.com/restic/restic)
[![Coverage Status](https://coveralls.io/repos/restic/restic/badge.svg)](https://coveralls.io/r/restic/restic)

Restic Design Principles
========================

Restic is a program that does backups right and was designed with the following
principles in mind:

 * Easy: Doing backups should be a frictionless process, otherwise you might be
   tempted to skip it.  Restic should be easy to configure and use, so that, in
   the event of a data loss, you can just restore it. Likewise,
   restoring data should not be complicated.

 * Fast: Backing up your data with restic should only be limited by your
   network or hard disk bandwidth so that you can backup your files every day.
   Nobody does backups if it takes too much time. Restoring backups should only
   transfer data that is needed for the files that are to be restored, so that
   this process is also fast.

 * Verifiable: Much more important than backup is restore, so restic enables
   you to easily verify that all data can be restored.

 * Secure: Restic uses cryptography to guarantee confidentiality and integrity
   of your data. The location the backup data is stored is assumed not to be a
   trusted environment (e.g. a shared space where others like system
   administrators are able to access your backups). Restic is built to secure
   your data against such attackers.

 * Efficient: With the growth of data, additional snapshots should only take
   the storage of the actual increment. Even more, duplicate data should be
   de-duplicated before it is actually written to the storage back end to save
   precious backup space.


Build restic
============

Install Go/Golang (at least version 1.3), then run `go run build.go`,
afterwards you'll find the binary in the current directory:

    $ go run build.go

    $ ./restic --help
    Usage:
      restic [OPTIONS] <command>

    Application Options:
      -r, --repo= Repository directory to backup to/restore from

    Help Options:
      -h, --help  Show this help message

    Available commands:
      backup     save file/directory
      cache      manage cache
      cat        dump something
      check      check the repository
      find       find a file/directory
      init       create repository
      key        manage keys
      list       lists data
      ls         list files
      restore    restore a snapshot
      snapshots  show snapshots
      unlock     remove locks
      version    display version

A short demo recording can be found here:
[![asciicast](https://asciinema.org/a/23554.png)](https://asciinema.org/a/23554)

Compatibility
=============

Backward compatibility for backups is important so that our users are always
able to restore saved data. Therefore restic follows [Semantic
Versioning](http://semver.org) to clearly define which versions are compatible.
The repository and data structures contained therein are considered the "Public
API" in the sense of Semantic Versioning.

We guarantee backward compatibility of all repositories within one major version;
as long as we do not increment the major version, data can be read and restored.
We strive to be fully backward compatible to all prior versions.

Contribute and Documentation
============================

Contributions are welcome! More information can be found in
[`CONTRIBUTING.md`](CONTRIBUTING.md). A document describing the design of
restic and the data structures stored on the back end is contained in
[`doc/Design.md`](doc/Design.md).
The development environment is described in [`CONTRIBUTING.md`](CONTRIBUTING.md).

Contact
=======

If you discover a bug or find something surprising, please feel free to [open a
github issue](https://github.com/restic/restic/issues/new). If you would like
to chat about restic, there is also the IRC channel #restic on
irc.freenode.net. Or just write me an email :)

**Important**: If you discover something that you believe to be a possible critical
security problem, please do *not* open a GitHub issue but send an email directly to
alexander@bumpern.de. If possible, please encrypt your email using PGP
([0xD3F7A907](https://pgp.mit.edu/pks/lookup?op=get&search=0x91A6868BD3F7A907)).

Talks
=====

The following talks will be or have been given about restic:

 * 2015-08-23: [A Solution to the Backup Inconvenience](https://programm.froscon.de/2015/events/1515.html): Lecture at [FROSCON 2015](https://www.froscon.de) in Bonn, Germany
 * 2015-02-01: [Lightning Talk at FOSDEM 2015](https://www.youtube.com/watch?v=oM-MfeflUZ8&t=11m40s): A short introduction (with slightly outdated command line)
 * 2015-01-27: [Talk about restic at CCC Aachen](https://videoag.fsmpi.rwth-aachen.de/?view=player&lectureid=4442#content) (in German)

License
=======

Restic is licensed under "BSD 2-Clause License". You can find the complete text
in the file `LICENSE`.
