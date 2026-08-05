
function demo 
    mkdir -p tmp
    zellij ac new-tab --block-until-exit --layout ~/dotfiles/home/zellij/.config/zellij/layouts/demo.kdl --cwd tmp -- bash --norc

    rm -rf tmp
end
