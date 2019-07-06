REBAR3_URL=https://s3.amazonaws.com/rebar3/rebar3
ELVIS ?= $(shell which elvis)

# If building on travis, use the rebar in the current directory
ifeq ($(TRAVIS),true)
	REBAR = $(CURDIR)/rebar
endif

ifeq ($(wildcard rebar3),rebar3)
  REBAR3 = $(CURDIR)/rebar3
endif

# Fallback to rebar on PATH
REBAR3 ?= $(shell which rebar3)

# And finally, prep to download rebar if all else fails
ifeq ($(REBAR3),)
	REBAR3 = rebar3
endif


all: $(REBAR3)
	@$(REBAR3) do clean, compile, eunit

clean:
	@echo "Running rebar3 clean..."
	@$(REBAR3) clean -a

compile:
	@echo "Running rebar3 compile..."
	@$(REBAR3) as compile compile

coveralls:
	@echo "Running rebar3 coveralls send..."
	@$(REBAR3) as test coveralls send

dialyzer:
	@echo "Running rebar3 dialyze..."
	@$(REBAR3) dialyzer

edoc:
	@echo "Running rebar3 edoc..."
	@$(REBAR3) as edoc edoc

eunit:
	@echo "Running rebar3 eunit..."
	@$(REBAR3) do eunit -cv, cover -v

test: elvis xref eunit dialyzer

xref:
	@echo "Running rebar3 xref..."
	@$(REBAR3) xref

elvis:
	@echo "Running elvis rock..."
	@$(ELVIS) rock -V

travis: test coveralls

shell:
	@$(REBAR3) as shell shell

$(REBAR3):
	curl -Lo rebar3 $(REBAR3_URL) || wget $(REBAR3_URL)
	chmod +x ./rebar3

.PHONY: all clean compile tests eunit xref coveralls edoc shell dialyzer rebar3
