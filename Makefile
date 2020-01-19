REBAR3_URL=https://s3.amazonaws.com/rebar3/rebar3

ifeq ($(wildcard rebar3),rebar3)
  REBAR3 = $(CURDIR)/rebar3
endif

# Fallback to rebar on PATH
REBAR3 ?= $(shell which rebar3)

# And finally, prep to download rebar if all else fails
ifeq ($(REBAR3),)
REBAR3 = rebar3
endif

all: compile

get-deps:
	./c_src/build_deps.sh get-deps

deps:
	$(REBAR3) get-deps

rm-deps:
	./c_src/build_deps.sh rm-deps

compile: deps
	$(REBAR3) compile

clean:
	$(REBAR3) clean

$(REBAR3):
	curl -Lo rebar3 $(REBAR_URL) || wget $(REBAR_URL)
	chmod a+x rebar3

include tools.mk
