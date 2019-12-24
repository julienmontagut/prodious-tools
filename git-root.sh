#!/bin/sh

# While there is a
git-root() {
    while [[ -d ../.git ]]; do
        cd ..
        cd $(git rev-parse --show-toplevel)
    done
}
