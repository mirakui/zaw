function zaw-src-git-all-files() {
    git rev-parse --git-dir >/dev/null 2>&1
    if [[ $? == 0 ]]; then
        git_root=`git rev-parse --show-toplevel`
        candidates=("${(ps:\0:)$(git ls-files -z ${git_root})[1,-2]}")
    fi
    actions=("zaw-callback-edit-file" "zaw-callback-append-to-buffer")
    act_descriptions=("edit file" "append to edit buffer")
    options=("-m")
}

zaw-register-src -n git-all-files zaw-src-git-all-files
