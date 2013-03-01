import os
import sh

bundle_dir = os.path.join(os.path.split(os.path.abspath(__file__))[0], "bundle")
git = sh.git.bake(_cwd=bundle_dir)
rm = sh.rm.bake("-rf", _cwd=bundle_dir)

vim_plugins_from_git = {
  "supertab" : "https://github.com/ervandew/supertab.git",
  "nerdtree" : "https://github.com/scrooloose/nerdtree.git",
  "nerdcommenter" : "https://github.com/scrooloose/nerdcommenter.git",
  "syntastic" : "https://github.com/scrooloose/syntastic.git",
  "xptemplate" : "https://github.com/drmingdrmer/xptemplate.git",
  "surround" : "https://github.com/tpope/vim-surround.git"
}

def fetch_vim_plugins_from_git():
  for name, git_repo in vim_plugins_from_git.iteritems():
    plugin_path = os.path.join(bundle_dir, name)
    print "Removing {}".format(plugin_path)
    rm("{}".format(plugin_path))

    print "Cloning {} into {}".format(git_repo, name)
    git.clone(git_repo, name)

    print "Removing git meta data from {}".format(name)
    rm(os.path.join(plugin_path, ".gitignore"), os.path.join(plugin_path, ".git"))
    print

def main():
  fetch_vim_plugins_from_git()

if __name__ == "__main__":
  main()
