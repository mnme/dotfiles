function gsl --wraps='git stash list --pretty=format:"%C(dim bold magenta)%gd%C(reset) %<(70,trunc)%gs %C(green)(%cr)"' --description 'alias gsl=git stash list --pretty=format:"%C(dim bold magenta)%gd%C(reset) %<(70,trunc)%gs %C(green)(%cr)"'
  git stash list --pretty=format:"%C(dim bold magenta)%gd%C(reset) %<(70,trunc)%gs %C(green)(%cr)" $argv; 
end
