## dotfiles

Delete hidden files in the home directory to avoid a stow conflict.

```
rm ~/.bash*
```

Clone the dotfiles to a convenient location.

```
git clone --depth 1 https://git.sr.ht/~tonijarjour/dotfiles ~/.fn
```

`cd` is required. Edit `install.sh` as needed.

```
cd ~/.fn
bash install.sh
```

### mu4e

Make the mail directory then retrieve the emails.

```
mkdir -p ~/.local/mail/Inbox
mbsync -a
```

Initialize and index the `mu` database.

```
mu init --maildir=~/.local/mail --my-address=tonijarjour@posteo.com
mu index
```
