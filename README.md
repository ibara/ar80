ar80
====
`ar80` is a library archiver utility for CP/M and MS-DOS.

It is able to produce libraries from object files created by
[`a80`](https://github.com/ibara/a80).

These libraries are able to be linked with
[`l80`](https://github.com/ibara/l80).

Building
--------
`ar80` should build with any
[D](https://dlang.org/)
compiler for any supported platform. I use
[GDC](https://gdcproject.org/)
on
[OpenBSD](https://www.openbsd.org/)
and that works well.

Running
-------
`usage: ar80 library file1.obj [file2.obj ...]`

The `.lib` extension is automatically appended to `library`.

License
-------
ISC License. See `LICENSE` for details.
