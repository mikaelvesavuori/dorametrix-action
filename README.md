# Dorametrix GitHub action

Conveniently call [Dorametrix](https://github.com/mikaelvesavuori/dorametrix) to create a deployment event.

Looking for a demo? In that case you might be interested in the [Dorametrix Pipe demo](https://github.com/mikaelvesavuori/demo-dorametrix-pipe).

## Setup and usage

You need to set two required secrets—`DORAMETRIX_ENDPOINT` and `DORAMETRIX_API_KEY`—in accordance with the overall [Dorametrix](https://github.com/mikaelvesavuori/dorametrix) requirements.

### Remember...

- Always ensure you have secure settings regarding what actions you allow.
- Note that Dorametrix will _not_ work without access to the Git history (i.e. `with.fetch-depth: 0`).

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
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: dorametrix
        uses: mikaelvesavuori/dorametrix-action@v1.0.1
        with:
          endpoint: ${{ secrets.DORAMETRIX_ENDPOINT }}
          api-key: ${{ secrets.DORAMETRIX_API_KEY }}
```
