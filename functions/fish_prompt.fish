function fish_prompt
  set -l right_prompt (set_color magenta)'['(date +%H:%M)']' (set_color $fish_color_cwd --bold)(prompt_pwd)(set_color normal)

  if test -n "$RBENV_ROOT"
    set right_prompt $right_prompt (set_color red --bold)'('(rbenv version-name)')'(set_color normal)
  end

  if git_is_repo
    set -l stashed ''

    if git_is_stashed
      set stashed '(stashed)'
    end

    set right_prompt $right_prompt (set_color blue)'['(git_branch_name)$stashed']' (git_porcelain)
  end

  echo $right_prompt
  set_color blue --bold
  echo -n "\$ "
end
