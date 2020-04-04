SHELL = /bin/ksh

USER_FULLNAME   = Emmanuel Macron
USER_BIRTHDATE  = 21 décembre 1977
USER_BIRTHPLACE = Amiens
USER_ADDRESS    = 55 Rue du Faubourg Saint-Honoré
USER_CITY       = à Paris

MD_PROLOGUE    := ---\nfontsize: 12pt\n# female: 1
MD_PROLOGUE    := $(MD_PROLOGUE)\nfullname: "$(USER_FULLNAME)"\naddress: "$(USER_ADDRESS)"\ncity: "$(USER_CITY)"
MD_PROLOGUE    := $(MD_PROLOGUE)\nbirthdate: "$(USER_BIRTHDATE)"\nbirthplace: "$(USER_BIRTHPLACE)"\n
MD_EPILOGUE     = \nlang: fr-FR\n---\n

PANDOC          = pandoc
PANDOC_FLAGS    = --template=c19-form --pdf-engine=xelatex
PANDOC_FORM1    = c19-certificate

TIMESTAMP       = $(shell date +%Y%m%d-%H%M)

all:
	@print 'usage: make <target>\n\nwhere <target> is one of:'
	@print -f '- %-10s: %s\n' family   $$'familial impérieux l\'assistance aux personnes vulnérables ou la garde d\'enfants.'
	@print -f '- %-10s: %s\n' fitness  $$'une activité physique individuelle à proximité du domicile.'
	@print -f '- %-10s: %s\n' health   $$'ma santé ou celle d\'un de mes proches confiné avec moi.'
	@print -f '- %-10s: %s\n' shopping $$'d\'effectuer des achats de première nécessité dans des établissements autorisés.'
	@print -f '- %-10s: %s\n' work     $$'un déplacement professionnel ne pouvant être différé.'

family:   family.pdf
fitness:  fitness.pdf
health:   health.pdf
shopping: shopping.pdf
work:     work.pdf

%.pdf:
	@typeset basename=$(basename $@) template=$(PANDOC_FORM1); \
	print "Building COVID-19 form for $$basename ($$basename-$(TIMESTAMP).pdf)"; \
	[[ -f $$basename.md ]] || print -f $$'$(MD_PROLOGUE)%s: 1$(MD_EPILOGUE)' $$basename > $$basename.md; \
	$(PANDOC) $(PANDOC_FLAGS) --template=$$template -i $$basename.md -o $$basename-$(TIMESTAMP).pdf

clean:
	-@rm {family,fitness,health,shopping,work}.{md,pdf} 2>/dev/null; true

realclean: clean
	-@rm *-????????-????.pdf

# vim: digraph nospell ts=4
