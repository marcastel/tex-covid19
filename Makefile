SHELL           = /bin/ksh
DATE            = $(shell date +%Y%m%d)
TIME            = $(shell date +%Hh)
TIMESTAMP       = $(DATE)-$(TIME)

MD_PROLOGUE     = ---\n
MD_EPILOGUE     = \n---\n

PANDOC          = pandoc --pdf-engine=xelatex *.yaml
PANDOC_FORM1    = templates/c19-certificate
PANDOC_FORM2    = templates/c19-authorisation

-include metadata-default.mk
-include metadata.mk

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

%.pdf: copy-private-data
	@typeset basename=$(basename $@) files=$$basename-$(TIMESTAMP).pdf form=$(PANDOC_FORM1); \
	print "Building COVID-19 form for $$basename ($$basename-$(TIMESTAMP).pdf)"; \
	[[ $$basename == work ]] && files+=" workauth-$(TIMESTAMP).pdf"; \
	[[ -f $$basename.md ]] || print -f $$'$(MD_PROLOGUE)%s: 1$(MD_EPILOGUE)' $$basename > $$basename.md; \
	for file in $$files; do \
	    $(PANDOC) --template=$$form -M website:$(URL_PATH)/$$file -i $$basename.md -o $$file; \
	    form=$(PANDOC_FORM2); \
	done; \
	[[ -n "$(SSH_PATH)" ]] && scp $$basename*-$(TIMESTAMP).pdf $(SSH_HOST):$(SSH_PATH)/; \
	[[ -n "$(SSH_PATH)" ]] && ssh $(SSH_HOST) sudo chown $(SSH_CHMOD) $(SSH_PATH)/$$basename*-$(TIMESTAMP).pdf

clean:
	-@rm {family,fitness,health,shopping,work}.md 2>/dev/null; true

copy-private-data:
	@for ext in mk yaml; do \
	    [[ -f metadata.$$ext ]] && continue; \
	    [[ -f $(HOME)/Briefcase/_data/github/marcastel/tex-covid19/metadata.$$ext ]] || continue; \
	    ln -s $(HOME)/Briefcase/_data/github/marcastel/tex-covid19/metadata.$$ext metadata.$$ext; \
	done

realclean: clean remote-clean
	-@rm {family,fitness,health,shopping,work,workauth}-*.pdf 2>/dev/null; true

remote-ls:
	-@[[ -n "$(SSH_PATH)" ]] && ssh $(SSH_HOST) ls $(SSH_PATH)/*.pdf; true

remote-clean:
	-@[[ -n "$(SSH_PATH)" ]] && ssh $(SSH_HOST) rm $(SSH_PATH)/*.pdf; true

# vim: digraph nospell ts=4
