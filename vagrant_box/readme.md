## Install Instructions 

```
// Install virtualbox and vagrant
git@git.spies.ws:dev/developer_vagrant_box.git
cd developer_vagrant_box
mkdir ~/projects/vagrant
vagrant up
// you will eventually be prompted for your password

vagrant reload
vagrant ssh

```

- If you want to pass along  things like your `.dotfiles` or `.ssh` keys check out the `Vagrantfile` and uncomment the lines related to that. 
I also have a `syncdotfiles.sh` script  that will simplink your dotfiles that you can build off. FYI heavy modifications will be required for you to use that script.
- zsh available. If you want to switch type `chsh -s $(which zsh)` followed by the vagrant user password which is "vagrant"
- Destroy the old box using `vagrant destroy -f` and type vagrant up to get a new box

## Why?
I've been working on a virtual machine box that I can develop in because I'm tired of using a local environment that differs from our dev, stg, prod servers. Still very much a work in progress but I would love to get at least 1 frontend and 1 backend person to start using it to give me feedback. Hit me up if you're interested. 

Pros
- Work in the same environment we deploy to
  Stop having to fixing stupid clang issues and using brew. All these random things we run into never come up in production servers so why bother wasting our time on them. 
- New dev/freelancers can have a environment that has all our tools in 1 command (vagrant up) ~10 minutes
- Portability: Move from mac or windows and still have access to your projects
- Laptop agnostic: Upgrading or changing laptops doesn't effect your dev environment
- Mounts ~/projects folder into the virtual machine. You can still use any IDE and have access to the project files via your local os file browser
- Run docker natively
- Backups of your environment. You can package it all up and restore it if you wanted
- If you backup your .dotfiles you can basically format and restore your virtual machine in ~10 min to your working state

Cons
- You have to forward ports
- You're computer can't be have low amounts of ram

## List of things currently in the box:
Set up to our private cheese shop
Postgres 
build-essential
Python & various libraries like libxml and shit
vim 
nginx 
supervisor 
curl
redis-server
docker
virtualenv & virtualenv wrapper
Node
NPMG
Grunt
Go