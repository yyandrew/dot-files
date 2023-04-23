Use [GNU Stow](https://github.com/aspiers/stow) to manage dot files

### 使用方法
以 `~/.config/nvim` 软链接为示例
```
$ stow nvim # 将 dot-files/nvim 目录软链接到 ~/.config/nvim 目录
$ stow -D nvim # 删除 ~/.config/nvim 软链接
```
