CUSTOM_BUILD_TYPE ?= UNOFFICIAL
# OFFICIAL_DEVICES
ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/aosp/altho.devices)
    ifeq ($(filter $(CUSTOM_BUILD), $(LIST)), $(CUSTOM_BUILD))
      IS_OFFICIAL=true
      CUSTOM_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      CUSTOM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(CUSTOM_BUILD)")
    endif
endif

# Altho Props
Altho_BASE_VERSION = V-1.2-Jellyfish
Altho_CODENAME := Jellyfish

CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

CUSTOM_PLATFORM_VERSION := 12.1

CUSTOM_VERSION := Project-Altho_$(Altho_BASE_VERSION)-$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
CUSTOM_VERSION_PROP := twelve
