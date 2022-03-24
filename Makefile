EMACS = emacs
FILES = init.el early-init.el
DIR := ~/.emacs.d

TARGETS = $(addprefix $(DIR)/, $(FILES))

install: $(TARGETS)

$(DIR)/%.el:
	ln -sfr $(@F) $@

check:
	ls -l $(TARGETS)

clean:
	rm -f $(TARGETS)

remote:
	$(EMACS) -batch -l make.el -f install-remote

local:
	$(EMACS) -batch -l make.el -f install-local
