<p align="center">
  <img src="http://i.imgur.com/GMnses0.png">
</p>

data-dev-setup
============

Data developer setup, scripts, and tools.  Hacker defaults for OSX.

## General Apps and Tools

* [System Update](#system-update)
* [Google Chrome](#google-chrome)
* [Homebrew](#homebrew)
* [Sublime Text](#sublime-text)
* [Atom](#atom)
* [Terminal Customization](#terminal-customization)
* [Git](#git)
* [Vim](#vim)
* [Python](#python)
* [Pip](#pip)
* [Virtualenv](#virtualenv)
* [Ruby and RVM](#ruby-and-rvm)

## Data Analysis

* [Anaconda](#anaconda)
* [IPython Notebook](#ipython-notebook)
* [NumPy](#numpy)
* [Pandas](#pandas)
* [Matplotlib](#matplotlib)
* [Scikit-learn](#scikit-learn)
* [SciPy](#scipy)
* [Bokeh](#bokeh)
* [Spark](#spark)
* [MapReduce](#mapreduce)
* [Boto](#boto)
* [S3cmd](#s3cmd)
* [S3DistCp](#s3distcp)
* [S3-parallel-put](#s3-parallel-put)
* [Redshift](#redshift)
* [Kinesis](#kinesis)
* [Lambda](#lambda)
* [AWS Machine Learning](#aws-machine-learning)
* [MySQL](#mysql)
* [MySQL Workbench](#mysql-workbench)

## Dot Files

* [Using Git and the Bootstrap Script](#using-git-and-the-bootstrap-script)
* [Git-Free Install](#git-free-install)
* [Specify PATH](#specify-path)
* [Add Custom Commands](#add-custom-commands)
* [Sensible OSX Defaults](#sensible-osx-defaults)
* [Install Homebrew Formulae with Python2 and Python3](#install-homebrew-formulae-with-python2-and-python3)

## Misc

* [Contributions](#contributions)
* [Credits](#credits)

## System update

First thing you need to do on any OS, is to update the system.  On a Mac run the "App Store" and select the "Updates" icon.

## Install Apps

Some of the scripts below tweak settings on apps such as Chrome and SublimeText.  When setting up a new machine, it's helpful to install some commonly-used apps first.

## Google Chrome

Install your favorite browser, mine happens to be Chrome.

Download from [www.google.com/chrome](https://www.google.com/intl/en/chrome/browser/). Open the **.dmg** file once it's done downloading (this will mount the disk image), and drag and drop the **Google Chrome** app into the Applications folder (on the Mac, most applications are installed this way). When done, you can unmount the disk in Finder (the small "eject" icon next to the disk under **Devices**).

### Configuration

We'll visit the [section to run the script .osx](#sensible-osx-defaults) later in the installation process to configure Chrome.  Just install Chrome for now and continue reading :)

## Homebrew

Package managers make it so much easier to install and update applications (for Operating Systems) or libraries (for programming languages). The most popular one for OS X is [Homebrew](http://brew.sh/).

### Install

An important dependency before Homebrew can work is the **Command Line Tools** for **Xcode**. These include compilers that will allow you to build things from source.

Now, Xcode weights something like 2GB, and you don't need it unless you're developing iPhone or Mac apps. Good news is Apple provides a way to install only the Command Line Tools, without Xcode. To do this you need to go to [http://developer.apple.com/downloads](http://developer.apple.com/downloads), and sign in with your Apple ID (the same one you use for iTunes and app purchases). Unfortunately, you're greeted by a rather annoying questionnaire. All questions are required, so feel free to answer at random.

Once you reach the downloads page, search for "command line tools", and download the latest **Command Line Tools (OS X Mountain Lion) for Xcode**. Open the **.dmg** file once it's done downloading, and double-click on the **.mpkg** installer to launch the installation. When it's done, you can unmount the disk in Finder.

**Note**: If you are running **OS X 10.9 Mavericks**, then you can install the Xcode Command Line Tools directly from the command line with `$ xcode-select --install`, and you don't have to go through the download page and the questionnaire.

Finally, we can install Hombrew! In the terminal paste the following line (without the `$`), hit **Enter**, and follow the steps on the screen:

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

One thing we need to do is tell the system to use programs installed by Hombrew (in `/usr/local/bin`) rather than the OS default if it exists. We do this by adding `/usr/local/bin` to your `$PATH` environment variable:

    $ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

Open a new terminal tab with **Cmd+T** (you should also close the old one), then run the following command to make sure everything works:

    $ brew doctor

### Usage

We'll visit the [section to run the script brew.sh](#install-homebrew-formulae-with-python2-and-python3) later in the installation process to install a number of useful Homebrew formulae.  Because our brew.sh will automate the install of the Homebrew formulae we'll need, the following is provided mainly for reference.

To install a package (or **Formula** in Homebrew vocabulary) simply type:

    $ brew install <formula>

To update Homebrew's directory of formulae, run:

    $ brew update

**Note**: I've seen that command fail sometimes because of a bug. If that ever happens, run the following (when you have Git installed):

    $ cd /usr/local
    $ git fetch origin
    $ git reset --hard origin/master

To see if any of your packages need to be updated:

    $ brew outdated

To update a package:

    $ brew upgrade <formula>

Homebrew keeps older versions of packages installed, in case you want to roll back. That rarely is necessary, so you can do some cleanup to get rid of those old versions:

    $ brew cleanup

To see what you have installed (with their version numbers):

    $ brew list --versions

## Using Git and the Bootstrap Script

You can clone the repository wherever you want. (I like to keep it in `~/dev/data-dev-setup`, with `~/data-dev-setup` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/donnemartin/data-dev-setup.git && cd data-dev-setup && source bootstrap.sh
```

To update, `cd` into your local `data-dev-setup` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Git-Free Install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/donnemartin/data-dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

## Specify PATH

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/donnemartin/data-dev-setup/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

## Add Custom Commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Donne Martin"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="donne.martin@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/donnemartin/data-dev-setup/fork) instead, though.

## Sensible OSX Defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Install Homebrew Formulae Including Python2 and Python3

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Contributions

Bug reports and suggestions are [welcome](https://github.com/donnemartin/data-dev-setup/issues)!

## Credits

This repo builds on the awesome work from the following repos:

* [dotfiles](https://github.com/mathiasbynens/dotfiles) by Mathias Bynens
* [mac-dev-setup](https://github.com/nicolashery/mac-dev-setup) by Nicolas Hery