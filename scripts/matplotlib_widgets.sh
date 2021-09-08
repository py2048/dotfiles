#!/usr/bin/env zsh
ipy=$HOME/.ipython/profile_default/startup/mpl_widget.ipy
base=${ipy%.*}
mess="matplotlib ipython witgets"

[ -f "$ipy" ] && (mv "$ipy" "$base" && echo "$mess" disabled) || (mv "$base" "$ipy" && echo "$mess" enabled)
