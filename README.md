# DrDroid Homebrew tap

```
brew install --cask drdroidlab/tap/marmot
```

| Cask | What it is |
|---|---|
| [`marmot`](Casks/marmot.rb) | Claude plan limits, cost and nudges in the macOS menu bar. [DrDroidLab/marmot](https://github.com/DrDroidLab/marmot) |

Each cask points at a GitHub Release of its app. To ship a new version, update `version` and `sha256` in the cask (`macos/scripts/package.sh` in the app's repo prints both).
