# Introduction

## What is Lotus?

Lotus is a Ruby MVC web framework comprised of many micro-libraries. It has a
simple, stable API, a minimal DSL, and prioritises using plain objects over
magical, over-complicated classes with too much responsibility.

The natural repercussion of using simple objects with clear responsibilities
is that implementations will require more boilerplate code than other
frameworks that do not make the same choice. Lotus provides ways to mitigate
this extra legwork while keeping the underlying implementation the same.


## Why Choose Lotus?

Here are three compelling reasons:

### Lotus is Lightweight

Lotus's code is relatively short, and it only concerns itself with the things
that all web applications&mdash;regardless of implementation&mdash;need.
Lotus also ships with several optional modules that can be included if you
need, and other libraries that extend functionality can be included easily.

### Lotus is Architecturally Sound

If you've ever felt like you're stretching against the 'Rails way', or found
it difficult to write tests for your Sinatra routes, you'll appreciate Lotus.
Lotus keeps controller actions class-based and easily testable in isolation.
Lotus also encourages you to write your application logic in use case or
workflow objects, and views are separated from templates so the logic inside
of them can be well-contained and tested in isolation.

### Lotus is Threadsafe

Making use of green threads is a great way to boost the performance of your
application. It shouldn't be hard to write thread-safe code, and Lotus (when
used as the entire framework, or when a few explicit instructions are
followed when using only parts of it) is runtime threadsafe.

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
