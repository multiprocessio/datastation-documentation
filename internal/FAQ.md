# Documentation FAQ

## Taking a screenshot

Use a mac. Command-shift-5 and take a screenshot of the whole application window.

## Taking a screen recording

Use a mac. Open
[./internal/background.html](./internal/background.html) for use as a
standard background. Open DataStation and keep the default window
size. Use command-shift-5 and resize the selected window area to fit
the DataStation window with a half inch of margin on all sides showing
the HTML background page. The recorded size should be 1530x930px.

Install ffmpeg (`brew install ffmpeg`). And for each recording turn it into a GIF with:

```bash
$ ./scripts/gifify.sh X.mov Y.gif
```
