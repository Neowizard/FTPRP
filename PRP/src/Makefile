.PHONY: prp preprocess search


all: release debug
release: preprocess_r search_r
debug : preprocess_d search_d

preprocess_r :
	$(MAKE) -C preprocess release

search_r :
	$(MAKE) -C search release

preprocess_d :
	$(MAKE) -C preprocess debug

search_d :
	$(MAKE) -C search debug
