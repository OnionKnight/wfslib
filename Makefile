WFSLIB_DIR=wfslib
WFS_EXTRACT_DIR=wfs-extract
WFS_FUSE_DIR=wfs-fuse
WFS_FILE_INJECTOR_DIR=wfs-file-injector
SUBDIRS=$(WFSLIB_DIR) $(WFS_EXTRACT_DIR) $(WFS_FUSE_DIR) $(WFS_FILE_INJECTOR_DIR)
CLEAN_SUBDIRS=$(addsuffix clean,$(SUBDIRS))

.PHONY: all clean $(SUBDIRS) $(CLEAN_SUBDIRS)

all: $(SUBDIRS)

clean: $(CLEAN_SUBDIRS)

$(WFS_EXTRACT_DIR): $(WFSLIB_DIR)
$(WFS_FUSE_DIR): $(WFSLIB_DIR)
$(WFS_FILE_INJECTOR_DIR): $(WFSLIB_DIR)

$(SUBDIRS):
	$(MAKE) -C $@

$(CLEAN_SUBDIRS):
	$(MAKE) -C $(@:%clean=%) clean
