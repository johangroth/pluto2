#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/*
for each token in the postfix expression:
  if token is an operator:
    operand_2 ← pop from the stack
    operand_1 ← pop from the stack
    result ← evaluate token with operand_1 and operand_2
    push result back onto the stack
  else if token is an operand:
    push token onto the stack
result ← pop from the stack
*/
 
void die(const char *msg)
{
	fprintf(stderr, "%s", msg);
	abort();
}
 
#define MAX_D 256
double stack[MAX_D];
int depth;
 
void push(double v)
{
	if (depth >= MAX_D) die("stack overflow\n");
	stack[depth++] = v;
}
 
double pop()
{
	if (!depth) die("stack underflow\n");
	return stack[--depth];
}
 
double rpn(char *s)
{
	double a, b;
	int i;
	char *e, *w = " \t\n\r\f";
 
	for (s = strtok(s, w); s; s = strtok(0, w)) {
		a = strtod(s, &e);
		if (e > s)		printf(" :"), push(a);
#define binop(x) printf("%c:", *s), b = pop(), a = pop(), push(x)
		else if (*s == '+')	binop(a + b);
		else if (*s == '-')	binop(a - b);
		else if (*s == '*')	binop(a * b);
		else if (*s == '/')	binop(a / b);
		else if (*s == '^')	binop(pow(a, b));
#undef binop
		else {
			fprintf(stderr, "'%c': ", *s);
			die("unknown operator\n");
		}
		for (i = depth; i-- || 0 * putchar('\n'); )
			printf(" %g", stack[i]);
	}
 
	if (depth != 1) die("stack leftover\n");
 
	return pop();
}
 
int main(void)
{
	char s[] = " 3 4 2 * 1 5 - 2 3 ^ ^ / + ";
	printf("%g\n", rpn(s));
	return 0;
}

