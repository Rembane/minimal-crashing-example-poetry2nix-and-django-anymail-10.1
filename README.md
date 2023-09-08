# README

**tldr:** `poetry2nix` can't build `django-anymail[postmark]` version 10.1.

## Error:

It seems like something in the build + installation chain tries to install an
extra I do not need where `cryptography` is needed and can't be built. The
machinery doesn't seem to listen to my instructions that it shouldn't install
any extras at all which is fascinating.

## Error message:

```
ERROR: Could not find a version that satisfies the requirement cryptography; sys_platform != "darwin" or platform_machine != "arm64" or python_version >= "3.9" and extra == "postal" (from django-anymail) (from versions: none)
ERROR: No matching distribution found for cryptography; sys_platform != "darwin" or platform_machine != "arm64" or python_version >= "3.9" and extra == "postal"

error: builder for '/nix/store/n4dcfphqn6187w567s97rh6k4ns36ia7-python3.10-django-anymail-10.1.drv' failed with exit code 1
error: 1 dependencies of derivation '/nix/store/2zp58aynr7xmnvz1ggbxp31r4ci6g7sd-python3.10-tmp-0.1.0.drv' failed to build
```

## How to reproduce:

```bash
nix-shell
nix-build
```
