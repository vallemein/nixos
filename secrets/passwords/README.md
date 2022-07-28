# Setting user password

```bash
mkpasswd -m sha-512
```

then

```bash
nix run github:ryantm/agenix -- -e ./passwords/<username>.age
```
