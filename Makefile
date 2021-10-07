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
