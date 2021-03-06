# Installation

Clone this repository to your `~/.dotfiles` folder:

```sh
git clone https://github.com/richardrowe/dotfiles.git ~/.dotfiles
```

Now you have two options, you can either install _only_ the dotfiles
(configurations for vim, tmux etc). Or you can install both the dotfiles, and
have [Ansible](https://github.com/richardrowe/ansible-osx-env) install binaries, apps, and configure your osx machine
for you.

## I just want dotfiles

```sh
cd ~/.dotfiles
bash sync.sh
```

## I want dotfiles, and I want to setup my machine with Ansible

It's recommended that you make a fork of [these ansible
configs](https://github.com/richardrowe/ansible-osx-env). If you don't know what Ansible is yet, don't worry -
you can read up on it later.

If you've made a fork ensure that you edit `/env_vars/main.yml` in your `ansible-osx-env` fork accordingly.


Install vim plugins:

```sh
vim --noplugin +PlugInstall
```

## Vim

The `.vimrc` is designed to degrade elegantly. So if you chuck it on a remote server without installing any plugins, it
should still work. Hence, the guide for the vimrc below is split into _Core_ for features that will be available
on a basic install with no plugins. And _Plugins_, which documents features available after you do a `:PlugInstall`. A
good way to grok these is to start from the core, and learn the kemappings for each plugin one by one, rather than
trying to understand everything in one big go!

### Core

A lot of these are vim defaults, but documented because they are good to have in your vim-flow ;)
Leader is mapped to `,`.

#### Navigation

Buffer navigation:

Across the file:

* `<esc>` - Normal mode. _If you're using Karabiner, just tap your left ctrl key (which replaces where the capslock key usually is)_.
* `<g><;>` - Jump to previous insert point
* `<spacebar>` - Search (alias of `/`). _Use this to navigate to hard-to-reach places_.
* `<?>` - Search backwards
* `<z><z>` - Scroll so cursor is centered on screen
* `<z><t>` - Scroll so cursor is top of sreen
* `<z><b>` - Scroll so cursor is bottom of sreen
* `<ctrl-d>` - Page down
* `<ctrl-u>` - Page up

Across the viewport:

* `<ctrl-e>` - One line down without moving cursor
* `<ctrl-y>` - One line up without moving cursor
* `<H>` - Move cursor to top of screen
* `<M>` - Move cursor to middle of screen
* `<L>` - Move cursor to bottom of screen
* `<Number><j/k>` - Move X lines down/up. _Use this in combination with the <Tab> numpad for super fast movements_.

Across the current line:

* `<s><*><*>` - Seek to the first occurence of the `**` combination on the line
* `<f><*>` - Seek to the first occurence of `*` on the line
* `<t><*>` - Seek to one character before the first occurence of `*` on the line

File navigation:

* `<ctrl+]>` - Jump to first tag match, or select match if multiple (alias of `<g><ctrl+]>`)
* `<ctrl+o>` - Jump back
* `<ctrl+i>` - Jump forwards

Pane navigation:

* `<ctrl+j>` - Next pane
* `<ctrl+k>` - Previous pane
* `<ctrl+l>` - Expand current pane
* `<ctrl+h>` - Compress current pane

#### Editing

* `<,><w>` - Save file
* `<->` - Reduce number
* `<+>` - Increase number

### Plugins

#### [Unite][unite]

* `<ctrl+t>` - Search tags
* `<ctrl+p>` - Search files
* `<enter>` - Show file annotation

#### [Ctrl-Space][ctrlspace]

You should [really read up on ctrlspace][ctrlspace] because there is just too much too cover here. But the basics are:

* `<ctrl+space>` - Open Ctrl-Space
* `<l>` - Toggle tablist
* `<w>` - Toggle workspace list
* `<enter>` - Open selected element

##### Buffer List

* `<enter>` - Open file
* `<v>` - Open file in vertical split
* `<[>` / `<]>` - Prev/Next file

#### Surround

* `cs<old><new>` - Change the `<old>` surrounding characters to `<new>`

#### Fugitive


[unite]: https://github.com/Shougo/unite.vim
[ctrlspace]: https://github.com/szw/vim-ctrlspace
[surround]: https://github.com/tpope/vim-surround


## Thanks

These dotfiles are based off @nathankot
