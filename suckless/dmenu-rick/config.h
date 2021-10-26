/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 1;
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

//#include  /home/alokesh/suckless/dmenu-rick/cyberpunk.h
static const char *colors[SchemeLast][2] = {
        /*     fg         bg       */
        [SchemeNorm] = { "#d7d7d5", "#1c61c2" },
        [SchemeSel] = { "#ffffff", "#711c91" },
        [SchemeSelHighlight] = { "#0abdc6", "#000000" },
        [SchemeNormHighlight] = { "#0abdc6", "#000000" },
        [SchemeOut] = { "#ffffff", "#123e7c" },
        [SchemeMid] = { "#d7d7d5", "#000000" },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 5;
