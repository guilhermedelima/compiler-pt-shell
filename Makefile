BINDIR=bin
SRCDIR=src
OBJDIR=obj
INCDIR=include

BISON=yacc
FLEX=flex
CC=gcc

CFLAGS=-W -Wall -I $(INCDIR)
LIBS=-lpq

TARGET=compiler

_HEADER=shell_parser.h pt_spell.h
_OBJ=pt_spell.o shell_parser.o
_F_FILE=lex.yy.c
_B_FILE=y.tab.c

HEADER=$(patsubst %,$(INCDIR)/%,$(_HEADER))
OBJ=$(patsubst %,$(OBJDIR)/%,$(_OBJ))
F_FILE=$(patsubst %,$(SRCDIR)/%,$(_F_FILE))
B_FILE=$(patsubst %,$(SRCDIR)/%,$(_B_FILE))

########## TARGETS ##########

$(TARGET): $(F_FILE) $(B_FILE) $(OBJ) $(LIBS)
	$(CC) $(CFLAGS) -o $(BINDIR)/$@ $^

$(F_FILE): $(SRCDIR)/lex.l
	$(FLEX) -o $@ $^

$(B_FILE): $(SRCDIR)/yacc.y
	$(BISON) -d $^ -o $@
	mv $(SRCDIR)/y.tab.h $(INCDIR)/

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADER)
	$(CC) $(CFLAGS) -c -o $@ $<


clean:
	rm -f *~ *.out
	rm -f $(BINDIR)/*
	rm -f $(OBJDIR)/*
	rm -f $(SRCDIR)/*~
	rm -f $(SRCDIR)/*yy.c
	rm -f $(SRCDIR)/*tab.c
	rm -f $(INCDIR)/*~
	rm -f $(INCDIR)/*tab.h
