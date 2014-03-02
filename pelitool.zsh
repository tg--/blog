#!/usr/bin/env zsh

# pelican binary
pelican=/usr/bin/pelican

# theme 
theme="themes/tg"

# content dir
content="__content"

# target dir
target="__published"

if [[ $# < 1 ]] || [[ $1 == "help" ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
	print "This is pelitool, a little helper for the pelican blog engine."
	print "It is intended to take over some annoying manual labor :)"
	print "Usage:"
	print "	$0 build -- to build the pelican blog"
	print "	$0 clean -- remove all files from target dir"
	print "	$0 conf -- open the pelican config file"
	print "	$0 new \"Post Headline\" -- to create a new post with (optional) title"
fi

# run pelican build
if [[ $1 == "build" ]]; then
	$pelican -t $theme -o $target $content
fi

# delete all files in the target directory
if [[ $1 == "clean" ]]; then
	print "Do you really want to delete all files in $output? (y)"
	read -q
	if [[ $REPLY == "y" ]]; then rm -rf $output/*; fi
fi

# open the pelican config file
if [[ $1 == "conf" ]]; then
	$EDITOR pelicanconf.py
fi

# new blogpost (including template)
if [[ $1 == "new" ]]; then
	postname="Unnamed"
	if (( $+2 )); then postname=$2; fi
	date=$(date +%Y%m%d_%H%M)
	postfile=${content}/${date}-${postname:gs/ /_/:l}.md
	if [[ -e $postfile ]]; then
		print "File $postfile already exists! Aborting."
		exit 1
	fi

	# create postfile prefilled with template
	print "date: $(date +%Y-%m-%d\ %T)\ntitle: $2\ncategory:\ntags:\n\n" > $postfile

	# if $EDITOR is set, fire up our editor!
	if (( $+EDITOR )); then
		$EDITOR $postfile
	fi

	# if content is under version control, lets git add
	if [[ -d $content/.git ]]; then
		# we need git 1.8.5 for the -C feature
		if [[ $(git --version) < "git version 1.8.5" ]]; then
			print "Your git version is too old, you need at least git 1.8.5!"
		else
			git -C $content add $postfile
			git -C $content commit -m "new post: $2"
		fi
	fi
fi
