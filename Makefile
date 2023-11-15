PATCHER_URL = https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
PATCHER_ZIP = FontPatcher.zip
PATCHER_DIR = FontPatcher
PATCHER = ${PATCHER_DIR}/font-patcher
PATCH_OPTS ?=
PATCH = fontforge -script ${PATCHER} -c ${PATCH_OPTS}

TTF = ComicShannsNerdFont-Regular.ttf
OTF = ComicShannsNerdFont-Regular.otf

.PHONY: all ttf otf clean
all: ttf otf
ttf: ${TTF}
otf: ${OTF}

${TTF}: v2/comic\ shanns\ 2.ttf ${PATCHER_DIR}
	${PATCH} v2/comic\ shanns\ 2.ttf

${OTF}: v2/comic\ shanns.otf ${PATCHER_DIR}
	${PATCH} v2/comic\ shanns.otf

${PATCHER_DIR}: ${PATCHER_ZIP}
	unzip $^ -d $@

${PATCHER_ZIP}:
	curl -L -o $@ ${PATCHER_URL}

clean:
	rm -rf ${TTF} ${OTF} ${PATCHER_ZIP} ${PATCHER_DIR}
