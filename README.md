Minimal config to show that `vim.lsp.buf.rename()` stops working in a virtual environment (if `pyvenv.cfg` exists in the same directory.)

## Build docker image
```
docker build -t nvim .
```
## Run
```
docker run -it --rm nvim /bin/bash
cd ~/mytest/
```

# Update
The issue is that the code is in the same directory as virtual environemnt. Pyright treats virtual environment directory as read-only.
