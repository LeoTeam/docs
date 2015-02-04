# Getting Started

## Assumptions

This guide assumes you have an appropriate version of Ruby installed
as outlined in the general [Requirements](../01-introduction/03-requirements.md)
document.

Furthermore, this guide assumes that you are downloading the main Lotus
repository, `lotus/lotus`. If you would like to contribute to one of the many
micro-libraries that compose Lotus, be sure to appropriately substitute for
`lotus` as appropriate. For example, if you wish to contribute to
`lotus/model`, in the step where you clone your forked repository, be sure to
run:

```bash
$ git clone git@github.com:<your_user_name>/model.git
```

## Summary

- Fork the lepository
- Clone the forked repository
- Run `bundle`
- Verify tests

## Forking the repository

Simply visit [this link](https://github.com/lotus/lotus/fork), or visit the
repository on GitHub, and click the 'Fork' button.

## Clone the forked repository

In your terminal, change directory to where you'd like your project to live,
and execute:

```bash
$ git clone git@github.com:<your_user_name>/lotus.git.
```

Be sure to substitute `<your_user_name>` for your GitHub user name (remove the
angle brackets as well).

## Bundle

Download the dependencies for Lotus by changing directory into the project and
bundling:

```bash
$ cd lotus
$ bundle
```

## Verify tests

Before you make changes, it is a good idea to verify that all the tests are
working, or at least to take note of those tests that are not. Run the
entire test suite by executing:

```bash
$ bundle exec rake
```

**This document is a stub. You can help by expanding it, reviewing its content,
or by verifying its correctness. Please file any issues in the
[Github Issue Tracker](https://github.com/lotus/docs/issues).**
