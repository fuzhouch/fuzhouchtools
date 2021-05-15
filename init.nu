# init.nu
let home = $nu.env.HOME

let myPath = (echo [ $home "bin" ] | str collect "/")
let localPath = "/usr/local/bin"
let rustPath = (echo [ $home ".cargo" "bin" ] | str collect "/")
let goPath = (echo [ $home "go" "bin" ] | str collect "/")
# TODO for Python in Linux
# TODO for NodeJS in Linux

# Avoid adding same path repeatedly.
#
# TODO
# A known bug here since nu 0.31.0, that uniq function can't be
# applied to a list, which contains values from string and $nu.path,
# even if they appears to be the same. For example, $nu.path may
# already contain "/usr/local/bin" when our $localPath has
# "/usr/local/bin" as well. In the code snippet below, the two
# "/usr/local/bin" paths will both exist after `uniq'.
#
# Root cause is the items in $nu.path has type *Path*. Appears uniq()
# operator treats paths and strings as different types, thus does not
# apply to them.
#
# A workaround is to covert $nu.path to string, then we combine them
# and do uniq() correctly. Note that a clever (and incorrect) way is to
# directly read path value in config.toml. It does not work in an
# all-defualt Nushell session because config.toml may have no content,
# while Nushell can assign a set of default path (e.g. /bin, /usr/bin)
# to $nu.path.
#
# It's unlikely to be a bug from type safety point of view, and a good
# news is it does not really break real use. But it's still very
# difficult to diagnose. Is it possible we suggest adding an option in
# uniq() operation, like -w, to warn such type mismatch?
let existingPaths = (echo $nu.path | each { str collect })
let dedupedPaths = (echo [ $myPath $rustPath $goPath $localPath $existingPaths ] | flatten | uniq)
config set path $dedupedPaths


# In China mainland we have to enable Goproxy to make sure we can
# build in most cases.
config set env [
    [ "GOPROXY" "GO111MODULE" "EDITOR" "HOMEBREW_CURLRC" ]; [ "https://goproxy.cn,direct" "on" "vim" "1" ]
]
