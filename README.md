# Visual Studio CodeのPluginとして実行する場合

## VSCode Neovimをインストール

https://marketplace.visualstudio.com/items/%EF%BC%9FitemName%EF%BC%9Dasvet

## キーマッピングを設定

VSCodeではCtrl-Shift+keyの入力をデフォルトではneovimに送れないので
キーバインドで明示的に設定する必要がある

keybindings.json

```
{
    "key": "ctrl+shift+i",
    "command": "vscode-neovim.send",
    "when": "editorTextFocus && neovim.mode != insert",
    "args": "<C-S-I>",
}
```

# Pluginでコンパイラを使用する場合

## MinGWをインストール

choco.exe install mingw

# パッケージマネージャ

## Packerをインストール

https://github.com/wbthomason/packer.nvim

## Packerで管理しているプラグインをインストール

:PackerInstall