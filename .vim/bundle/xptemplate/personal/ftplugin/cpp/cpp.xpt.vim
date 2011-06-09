XPTemplate priority=personal

XPT class
/*
 * Class `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^
 * Author: `$author^
 * File: `expand("%")^
 * Date created: `strftime("%Y %b %d")^
 */

#ifndef `toupper(expand("%:r"))^_H
#define `toupper(expand("%:r"))^_H

class `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^
{
public:
    `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^(`$SParg^`argument^`...^, `arg^`...^`$SParg^);
    ~`substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^();
    `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^(`$SParg^const `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^ &rhs`$SParg^);
    `cursor^
private:

}; //class `substitute(expand("%:r"), "\\w\\+", "\\u\\0", "")^

#endif
..XPT

XPT funh
/**
 * @description
 * `cursor^
 */
`void^ `functionName^(`$SParg^`argument^`...^, `arg^`...^`$SParg^)` const^;
..XPT

XPT func
/**
 * @description
 * `cursor^
 */
`void^ `functionName^(`$SParg^`argument^`...^, `arg^`...^`$SParg^)
{

}
..XPT

XPT main
/**
 * `cursor^
 */
int main(`$SParg^int argc, char **argv`$SParg^)
{
   return 0;
}
..XPT

XPT switch
switch(`choice^)
{  
`...^   case `0^:
      `^
      break;
      
`...^default:
      `^
}
