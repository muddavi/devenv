#!/usr/bin/env python3

'''
This script clones the necessary vim plugins to satisfy the vimrc config.
'''

import os
import shutil
import subprocess

from pathlib import Path


def clone_plugins(path):
    '''
    Clone the following plugins:
        Vundle
        nerdtree
        rust
        vim-code-dark
        vim-deus
    '''
    repos = [
        'https://github.com/Vundlevim/Vundle.vim.git',
        'https://github.com/scrooloose/nerdtree.git',
        'https://github.com/rust-lang/rust.vim.git',
        'https://github.com/tomasiser/vim-code-dark.git',
        'https://github.com/ajmwagar/vim-deus.git'
    ]

    cmd = 'git clone {} {}'
    for repo in repos:
        _ = subprocess.run(cmd.format(repo, os.path.join(path, repo.split('/')[-1].replace('.git', ''))), shell=True)


def copy_colors(bundle_path, color_path):
    '''
    This function copies the color .vim files from the bundle directory to the colors directory.
    '''
    dirs = [os.path.join(bundle_path, d, 'colors') for d in ['vim-code-dark', 'vim-deus']]

    color_files = []
    for d in dirs:
        color_files += [f for f in os.listdir(d) if f.endswith('.vim')]

    for f in color_files:
        shutil.copy(os.path.join(bundle_path, f), os.path.join(color_path, f))


def create_ftplugins(path):
    '''
    '''

    contents = '''
" File ~/.vim/ftplugin/{}.vim
" {} specific settings
set colorcolumn=91
'''

    with open(os.path.join(path, 'c.vim'), 'w') as f:
        f.write(contents.format('c', 'C'))

    with open(os.path.join(path, 'cpp.vim'), 'w') as f:
        f.write(contents.format('cpp', 'CPP'))


def main():
    '''
    Create appropriate directories and setup config.
    '''
    # Create vim config directories
    vim_dir = os.path.join(Path.home(), '.vim')

    if not os.path.isdir(vim_dir):
        os.mkdir(vim_dir)

    bundle_dir = os.path.join(vim_dir, 'bundle')
    if not os.path.isdir(bundle_dir):
        os.mkdir(bundle_dir)

    colors_dir = os.path.join(vim_dir, 'colors')
    if not os.path.isdir(colors_dir):
        os.mkdir(colors_dir)

    ftplugin_dir = os.path.join(vim_dir, 'ftplugin')
    if not os.path.isdir(ftplugin_dir):
        os.mkdir(ftplugin_dir)

    # Clone plugins
    clone_plugins(bundle_dir)

    # Clone color plugins
    copy_colors(bundle_dir, colors_dir)

    # Create ftplugins
    create_ftplugin(ftplugin_dir)

if __name__ == '__main__':
    main()
