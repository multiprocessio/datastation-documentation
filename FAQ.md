# Documentation FAQ

## Taking a screenshot

Use a mac. Command-shift-5 and take a screenshot of the whole application window.

## Taking a screen recording

Use a mac. Open DataStation and keep the default window size. Use
command-shift-5 and resize the selected window area to fit the
DataStation window.

Install ffmpeg (`brew install ffmpeg`). And for each recording turn it into a GIF with:

```bash
$ ./scripts/gifify.sh X.mov Y.gif
```
