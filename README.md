# blossomos-sdk

Builds a metapackage RPM that installs all dependencies needed to develop and build BlossomOS components.

## What it includes

- `@development-tools` equivalents (gcc, make, git, gdb, ...)
- `rpm-build` / `rpmdevtools` for building RPM packages
- `cargo` / `rust` for building [Arc](../arc)
- Qt5, Qt6, KF5, KF6 dev packages for building [BlossomUI](../ui)

## Usage

```sh
./build.sh
rpm-ostree install ./rpmbuild/RPMS/noarch/blossomos-sdk-*.rpm
```

## License

MIT
