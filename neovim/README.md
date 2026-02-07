# Installation

Before downloading nvim (before running it for the first time), download tree-sitter first.
Probably version 2.25.10.
Copy the release as `tree-sitter` to `/usr/local/bin`.
Then run nvim for the first time.

## Docker Installation
```bash
sudo docker build . -t ndocker
sudo docker build --no-cache . -t ndocker
sudo docker run -it ndocker bash
sudo docker run -v ${PWD}/.:/home/work -it ndocker bash
```
