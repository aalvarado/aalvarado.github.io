# How to temporarily ignore Git changes

Add current tracked files added but that you want to ignore:

```
git status -s --column | cut -d' ' -f3- | xargs git update-index --assume-unchanged
```


Undo those changes:

```
git ls-files -v | grep ^h | cut -d' ' -f2- | xargs git update-index --no-assume-unchanged
```

for untracked files:

```
gst -s --column | cut -d' ' -f3- | xargs -I{} echo "{}" >> .git/info/exclude
```

to undo remove from `.git/info/exclude`
