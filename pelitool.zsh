#!/usr/bin/env zsh

# pelican binary
pelican=/usr/bin/pelican

# theme 
theme="themes/tg"

# content dir
content="__content"

# target dir
target="__published"

function print_help()
{
	print "This is pelitool, a little helper for the pelican blog engine."
	print "It is intended to take over some annoying manual labor :)"
	print "Usage:"
	print "	$1 build -- to build the pelican blog"
	print "	$1 clean -- remove all files from target dir"
	print "	$1 conf -- open the pelican config file"
	print "	$1 help -- show this help"
	print "	$1 new \"Post Headline\" -- to create a new post with (optional) title"
}

# create a new post
# argument 1: post title
function new_post()
{
	postname="Unnamed"
	if (( $+1 )); then postname=$1; fi
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
			git -C $content commit -m "new post: $1"
		fi
	fi
}


# validate command line parameters
case $1 in
	"build") # run pelican build
		$pelican -v -t $theme -o $target $content
	;;
	"clean") # delete all files in the target directory
		print "Do you really want to delete all files in $output? (y)"
		read -q
		if [[ $REPLY == "y" ]]; then rm -rf $output/*; fi
	;;
	"conf") # open the pelican config file
		$EDITOR pelicanconf.py
	;;
	"new") # new blogpost (including template)
		new_post $2
	;;
	"-h") # fall through
	;&
	"--help") # fall through again
	;&
	"help")	# print help
		print_help $0
		exit 0
	;;
	"") # empty argument
		print "You must pass a commandline argument.\n"
		print_help $0
		exit 1
	;;
	*) # Error handing
		print "Command \"$1\" not valid.\n"
		print_help $0
		exit 1
	;;
esac
