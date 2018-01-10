# linux-setup-tools
Quickly customize your Linux environment so you can get to work


## About 

Customize one script and have a predictable shell wherever you're logged in 

Get your dotfiles, install your packages, and bootstrap your 
linux server with three commands. 

```bash
curl -O http://sblack4.github.io/linux-setup-tools/setup.sh
chmod +x setup.sh
./setup.sh
```
or get fancy and shorten that url (try [goo.gl/](https://goo.gl/))
```bash
curl -L goo.gl/7gHfnq -o setup.sh
chmod +x setup.sh
./setup.sh
```

## Getting Started



### Prerequisites

Some knowledge of bash & Linux or the ability to use google :smiley:

Also, I've been using Docker to test


### Installing

1. Fork this repository
2. Add your favorite commands to the `COMMANDS` in `setup.sh` (it starts on line 17)
3. (optional) Use a url-shortener like [goo.gl/](https://goo.gl/) to shorten the url
4. Presto! You are ready to test it out, I recommend using 
[the Docker playground](http://play-with-docker.com/) so you don't mess up anything locally. 

### Testing


**This is dangerous as you can overwrite your local files**

See the dockerfile for more detailed instructions, I test by running 
```bash 
docker build -t test ./ && docker run -it test /bin/bash
```
and manually inspecting the container. 

## Contributing

If you've got cool ideas please share! 

I've tried to take a note from 
[Google's shell styleguide](https://google.github.io/styleguide/shell.xml)

Please read [CONTRIBUTING.md](.github/CONTRIBUTING.md) for details on our code of
 conduct, and the process for submitting pull requests to us 
 (This contributing doc is a github template).


## Acknowledgments

* Thanks to @PurpleBooth for the awesome [README Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2) 
* @renzok for the great [bash template](https://gist.github.com/renzok/ba603c044964b2c50153)
