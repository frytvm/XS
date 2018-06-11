fn ag {|*|
	.d 'Search tree for pattern in files'
	.a '[ag_OPTIONS] PATTERN [DIRECTORY]'
	.c 'alias'
	/usr/bin/ag --pager='less -iRFX' $*
}
fn c {
	.d 'Clear screen'
	.c 'alias'
	clear
}
fn dict {|*|
	.d 'Dictionary'
	.a '[dict_OPTIONS]'
	.c 'alias'
	/usr/bin/dict $* | less -iRFX
}
fn calc {|*|
	.d 'Evaluate arithmetic expression'
	.a 'nickle_EXPRESSION'
	.c 'alias'
	~ $#* 0 || nickle -e $*
}
fn htop {|*|
	.d 'Interactive process viewer'
	.a '[htop_OPTIONS]'
	.c 'alias'
	%with-terminal /usr/bin/htop $*
}
%cfn {%have mandelbulber} mb {|*|
	.c 'alias'
	mandelbulber $*
}
%cfn {%have mandelbulber2} mb2 {|*|
	.c 'alias'
	unwind-protect {
		mandelbulber2 $*
	} {
		rmdir --ignore-fail-on-non-empty ~/mandelbulber
	}
}
fn mutt {|*|
	.c 'alias'
	# mutt won't override st colors
	%with-tabbed-terminal env TERM=st /usr/bin/mutt $*
}
fn oclock {|*|
	.c 'alias'
	.a '[oclock_OPTIONS]'
	/usr/bin/oclock -transparent -bd gray -hour gray -minute gray $*
}
fn sysmon {
	.d 'View Monitorix stats'
	.c 'alias'
	web http://localhost:8080/monitorix
}
fn top {|*|
	.d 'Display processes'
	.a '[top_OPTIONS]'
	.c 'alias'
	%with-terminal /usr/bin/top $*
}
fn wn {|*|
	.d 'Wordnet'
	.a '[wn_OPTIONS]'
	.c 'alias'
	/usr/bin/wn $* | less -iFX
}
