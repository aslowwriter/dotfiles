

function clone

    set -l URL "$argv[1]"
    set -l DIR "$(basename -s .git $URL)"

    git clone $URL 
    if test -d $DIR; 
	cd $DIR

	if test -f .pre-commit-config.yaml || test -f prek.toml;
	    prek install
	end
    end

end
