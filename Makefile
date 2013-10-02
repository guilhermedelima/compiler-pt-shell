BINDIR=bin
SRCDIR=src
OBJDIR=obj
INCDIR=include

BISON=yacc
FLEX=flex
CC=gcc

CFLAGS=-W -Wall -I $(INCDIR)

all: flex bison $(SRCDIR)/pt_spell.c $(INCDIR)/pt_spell.h
	$(CC) $(CFLAGS) -o $(BINDIR)/compiler $(SRCDIR)/lex.yy.c $(SRCDIR)/y.tab.c $(SRCDIR)/pt_spell.c -lpq


flex: $(SRCDIR)/lex.l
	$(FLEX) -o $(SRCDIR)/lex.yy.c $(SRCDIR)/lex.l


bison: $(SRCDIR)/yacc.y
	$(BISON) -d $(SRCDIR)/yacc.y -o $(SRCDIR)/y.tab.c
	mv $(SRCDIR)/y.tab.h $(INCDIR)/


clean:
	rm -f *~ *.out
	rm -f $(BINDIR)/*
	rm -f $(OBJDIR)/*
	rm -f $(SRCDIR)/*~
	rm -f $(SRCDIR)/*yy.c
	rm -f $(SRCDIR)/*tab.c
	rm -f $(INCDIR)/*~
	rm -f $(INCDIR)/*tab.h

