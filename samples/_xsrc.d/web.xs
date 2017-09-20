fn web {|*|
	.d 'Open web URL'
	.a 'URL'
	.c 'web'
	let (error = false) {
		switch $#* (
		0 web-browser
		1 {web-browser $*}
		{throw error web 'spaces not allowed in URL'}
		)
	}
}

## Web lookups
fn .web-query {|site path query|
	if {~ $#query 0} {
		web-browser $site
	} else {
		let (q) {
			q = `{echo $^query|sed 's/\+/%2B/g'|tr ' ' +}
			web-browser $site^$path^$q
		}
	}
}
fn amazon {|*|
	.d 'Search Amazon'
	.a '[QUERY]'
	.c 'web'
	.r 'google scholar wikipedia youtube'
	.web-query https://amazon.com/ s/\?field-keywords= $*
}
fn google {|*|
	.d 'Search Google'
	.a '[QUERY]'
	.c 'web'
	.r 'amazon scholar wikipedia youtube'
	.web-query https://google.com/ search\?q= $*
}
fn guardian {
	.d 'The Guardian'
	.c 'web'
	web https://www.theguardian.com/us
}
fn jos {
	.d 'Joel On Software'
	.c 'web'
	web https://www.joelonsoftware.com/
}
fn lwn {
	.d 'Linux Weekly News'
	.c 'web'
	web https://lwn.net/
}
fn scholar {|*|
	.d 'Search Google Scholar'
	.a '[QUERY]'
	.c 'web'
	.r 'amazon google wikipedia youtube'
	.web-query https://scholar.google.com/ scholar\?hl=en\&q= $*
}
fn wikipedia {|*|
	.d 'Search Wikipedia'
	.a '[QUERY]'
	.c 'web'
	.r 'amazon google scholar youtube'
	.web-query https://en.wikipedia.org/ wiki/Special:Search\?search= $*
}
fn youtube {|*|
	.d 'Search YouTube'
	.a '[QUERY]'
	.c 'web'
	.r 'amazon google scholar wikipedia'
	.web-query https://youtube.com/ results\?search_query= $*
}