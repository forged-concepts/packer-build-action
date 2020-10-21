# Packer Build GitHub Action

The Github action is used for building automated machine images with [packer](https://www.packer.io/).

## Table Of Contents

- []

## Usage

Add the Action to your [GitHub Workflow](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#creating-a-workflow-file) like so:

```yaml
---

name: Packer Build

on:
  push:

jobs:
  packer:
    runs-on: ubuntu-latest
    name: packer

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Build Packer
        uses: forged-concepts/packer-build-action
        with:
          templatefile: "packer.json"
          varfile: "vars.json"
          options: "-color=true -on-error=abort"
          workingdirectory: "."
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.TEST_AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.TEST_AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: ${{ secrets.TEST_AWS_REGION }}

```

### Inputs

| Name               | Description                                                 | Required | Default       |
| ------------------ | ----------------------------------------------------------- | -------- | ------------- |
| `templatefile`     | the target template file to build                           | true     | `packer.json` |
| `varfile`          | a varfile to add to --var-file                              | false    |               |
| `options`          | list of options to pass into `packer build`                 | false    |               |
| `workingdirectory` | used to change the working directory of where to run packer | false    | `.`           |

#### `templatefile`

`templatefile` is a string used for the template file that packer build will use.

```yaml
    templatefile: test.packer.json
```

#### `varfile`

`varfile` is a string used for the template file. This is if you want an optional vars file with variables.

```yaml
  varfile: test.vars.json
```

#### `options`

`options` is a string of [options](https://www.packer.io/docs/commands/build#options) that are available for packer build.

```yaml
  options: "-color=true -on-error=abort"
```

#### `workingdirectory`

`workingdirectory` is a string to change directory before running packer build.

```yaml
  workingdirectory: './packer'
```

### Debugging

To enable debug logging, create a secret named `ACTIONS_STEP_DEBUG` with the value `true`. See [here](https://help.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-a-debug-message) for more information.
