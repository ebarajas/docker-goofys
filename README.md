to validate template / variables

```
packer validate --var-file=<varfile> <template>
```

so, currently, packer validate --var-file=vars.static.json config.json

for some reason I am having issues validating with the ENV variables in variables.json
