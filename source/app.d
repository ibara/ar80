/*
 * Copyright (c) 2021 Brian Callahan <bcallah@openbsd.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

import std.stdio;
import std.file;
import std.string;
import std.algorithm;

private ubyte[] rawobjs;

private void fileWrite(string outfile)
{
    import std.file : write;

    write(outfile, rawobjs);
}

int main(string[] args)
{
    if (args.length < 3) {
        stderr.writeln("usage: ar80 library file1.obj [file2.obj ...]");
        return 1;
    }

    foreach (size_t i; 2 .. args.length) {
        auto split = args[i].findSplit(".obj");

        if (split[1].empty) {
            stderr.writeln("ar80: error: object files must end in \".obj\"");
            return 1;
        }

        rawobjs ~= cast(ubyte[])read(args[i]);
    }

    fileWrite(args[1] ~ ".lib");

    return 0;
}
