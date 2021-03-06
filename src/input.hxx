/* input.hxx -- definitions for xs lexical analyzer */
#ifndef INPUT_HXX
#define INPUT_HXX

#define	MAXUNGET	2		/* maximum 2 character pushback */

struct Input {
	Input() : prev(NULL), name(NULL), buf(NULL), bufend(NULL),
		  bufbegin(NULL), rbuf(NULL), buflen(0),
		  ungot(0), lineno(0), fd(-3), runflags(0),
		  unget_fill(false), suppress_echo(false)
	{memzero(unget, sizeof(int) * MAXUNGET);}
	int get();
	virtual int fill()=0;
	virtual ~Input(){}
	Input *prev;
	const char *name;
	unsigned char *buf, *bufend, *bufbegin, *rbuf;
	size_t buflen;
	int unget[MAXUNGET];
	int ungot;
	int lineno;
	int fd;
	int runflags;
	bool unget_fill;
	bool suppress_echo;
};
extern Input *input;

inline int RGETC() {
	return input->get();
}

int GETC();
#define	UNGETC(c)	unget(input, c)


/* input.cxx */

extern void unget(Input *in, int c);
extern bool disablehistory;
extern void yyerror(const char *s);


/* token.cxx */

extern const char dnw[];
extern int yylex(void);
extern void inityy(void);
extern void print_prompt2(void);
extern int passign;


/* parse.y */

extern Tree *parsetree;
extern int yyparse(void);


/* heredoc.cxx */

extern void emptyherequeue(void);
#endif
