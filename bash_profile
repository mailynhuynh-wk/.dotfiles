export GAE_PREFIX=${HOME}/google-cloud-sdk/platform/google_appengine
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
eval "$(nodenv init -)"
nodenv shell 10.15.3
eval "$(pyenv init -)"
export GITHUB_ACCESS_TOKEN=3c1aca51eddfd03a1cf1b0bdce012dc03ce6a780

alias sky="source ~/.virtualenvs/skynet/bin/activate"
alias skynet="cd /Users/mailynhuynh/Git/skynet"
alias pers="cd /Users/mailynhuynh/Git/personal"
alias crack=""

# shortcuts for git
alias ga="git add"
alias gb="git branch"
alias gd="git diff --patience --ignore-space-change"
alias gh="git log --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short"
alias gl="git log --graph"
alias gc="git checkout"
alias gs="git status"
alias pack="git checkout HEAD -- frontend/package-lock.json"

ghusermap="\
andrew andrewlundberg-wf
kenny kennytrytek-wf
mark markgollnick-wf
jonas jonasray-wf
micah micahbeeman-wf
steven stevensheets-wk
tyler tylersnavely-wf
zahydee zahydeemachado-wk
"

function update() {
    othername="$(printf "$ghusermap" | while read line; do
      short="${line% *}"
      long="${line#* }"
      if [ "$1" = "$short" ]; then
        printf "%s\n" "$long"
        break
      fi
    done)"
    url="git@github.com:$othername/${PWD##*/}.git"
    git remote set-url other $url
    git remote update other --prune
}

function pr() {
    githubPath=$(git remote -v | awk '/^origin.*push.$/ { split($2, a, ":"); sub(".git$", "", a[2]); print a[2]; }')
    localBranch=$(git rev-parse --abbrev-ref HEAD)
    open "https:github.com/$githubPath/compare/Workiva:master...$localBranch"
}

function reset() {
    git reset --soft HEAD~"$1";
}

function stash() {
    git commit -am "stash commit";
}

function prs() {
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/')
    pwd=$(pwd)
    git checkout prs;
    cd /Users/mailynhuynh/Git/skynet/tools
    python prs.py
    git checkout $branch
    cd $pwd
}

function squash() {
    git fetch upstream
    git rebase -i master
}
~                                                                                                                                                                                                                                                                               
~                                                                                                                                                                                                                                                                               
~                                                                                                                                                                                                                                                                               
~                               
