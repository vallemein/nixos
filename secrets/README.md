# Agenix secrets volume

## Editing secret

1. Add to `secrets.nix` file

2. Edit

```bash
nix run github:ryantm/agenix -- -e ./<filename>.age
```

## Rekey

1. Modify ssh keys in `secrets.nix` file

2. Rekey

```bash
nix run github:ryantm/agenix -- -r
```

