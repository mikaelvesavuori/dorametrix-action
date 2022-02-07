# Dorametrix GitHub action

Conveniently call [Dorametrix](https://github.com/mikaelvesavuori/dorametrix) to create a deployment event.

## Setup and usage

You need to set two required secrets: `DORAMETRIX_ENDPOINT` and `DORAMETRIX_API_KEY`.

## Required input and output arguments

### `endpoint`

Dorametrix API endpoint, in the format `https://mydomain.com/stagename`.

### `api-key`

Dorametrix API token.

## Optional input and output arguments

### `product`

The product name can be optionally set. If not, it will default to the repository name.

## Secrets the action uses

This Action uses two secrets: `DORAMETRIX_ENDPOINT` and `DORAMETRIX_API_KEY`, as described above.

## Environment variables the action uses

If the product name is not set, Dorametrix will use `${{ github.event.repository.name }}` to grab the repository name.

## An example of how to use this action in a workflow

```yml
on: [push]

jobs:
  dorametrix:
    runs-on: ubuntu-latest
    name: Dorametrix
    steps:
      - uses: actions/checkout@v2
      - id: dorametrix
        uses: mikaelvesavuori/dorametrix-action@v1.0.0
        with:
          endpoint: ${{ secrets.DORAMETRIX_ENDPOINT }}
          api-key: ${{ secrets.DORAMETRIX_API_KEY }}
```
