```bash
sudo docker build . -t ndocker
sudo docker run -it ndocker bash
sudo docker run -v ${PWD}/.:/home/work -it ndocker bash
```
