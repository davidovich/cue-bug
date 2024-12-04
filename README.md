## Small repo to reproduce a CUE bug

1) Clone the repo
2) Run `cue export --with-context -l '_input:' -l 'filename' failure/config.cue failure/data.yaml`
3) See that the in-cue version of the library call correctly fails to validate that `notAllowed` is not allowed:

   ```
   notAllowed: field not allowed:
    ./failure/config.cue:1:1
    ./failure/config.cue:17:20
    ./failure/config.cue:18:2
    ./failure/config.cue:18:32
    ./failure/config.cue:19:3
    ./failure/config.cue:21:7
    ./failure/config.cue:24:14
    ./failure/config.cue:24:30
    ./failure/config.cue:28:10
    ./failure/config.cue:34:1
    ./failure/config.cue:34:15
    ./failure/data.yaml:4:3
   ```

4) Checkout the `use-imported-package` tag: `git checkout use-imported-package` (or edit `failure/config.cue` and
uncomment the conjunction on line 11 which uses the library call and comment
lines 17-24).
5) Observe that it doesn't fail when using the library call:

   ```bash
   $ cue export --with-context -l '_input:' -l 'filename' failure/config.cue failure/data.yaml
   {
      "Name": "$(pwd)/failure/data.yaml",
      "aField": true,
      "bField": "value",
      "notAllowed": true
   }
   ```

6) optional, checkout tag where it fails: `git checkout correctly-fails`
