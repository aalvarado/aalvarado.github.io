---
title: How to temporarily ignore Git changes
---

# How to temporarily ignore Git changes
Add current tracked files added but that you want to ignore but you want to update when upstream changes:

```
git status -s --column | cut -d' ' -f3- | xargs git update-index --assume-unchanged
```


Undo those changes:

```
git ls-files -v | grep ^h | cut -d' ' -f2- | xargs git update-index --no-assume-unchanged
```

For when you want to get a merge conflict if the upstream file changes you need to use

```
git update-index --skip-worktree myfile
```

For untracked files you can use:

```
gst -s --column | cut -d' ' -f3- | xargs -I{} echo "{}" >> .git/info/exclude
```

To start tracking them again, remove the file reference from `.git/info/exclude`
