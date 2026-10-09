# tobq's Homebrew tap and Scoop bucket

Install my apps with your package manager. Today: [BoardClip](https://boardclip.app), clipboard history with
search, groups, numpad quick paste and sync. The app itself lives at [tobq/boardclip](https://github.com/tobq/boardclip).

## macOS (Homebrew)

```sh
brew install --cask tobq/tap/boardclip
```

Update with `brew upgrade --cask boardclip`. The cask installs the universal app (Apple Silicon and Intel).

BoardClip is signed but not notarised by Apple (that needs a paid developer account), so a copy downloaded in a
browser asks once in System Settings > Privacy & Security. The cask removes the download quarantine flag from the
installed app, so it opens without that prompt.

## Windows (Scoop)

```powershell
scoop bucket add tobq https://github.com/tobq/homebrew-tap
scoop install tobq/boardclip
```

Update with `scoop update boardclip`.

## How it stays current

Every push to BoardClip's `main` publishes a numbered release with a `SHA256SUMS.txt`. The
[Update workflow](.github/workflows/update.yml) here checks for a newer release every 20 minutes, writes its
version and hashes into [`Casks/boardclip.rb`](Casks/boardclip.rb) and
[`bucket/boardclip.json`](bucket/boardclip.json), then installs both on clean macOS and Windows runners.
