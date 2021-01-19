.PHONY:clean default
INCLUDE_LUA?=
SHARED:=-fPIC --shared
CFLAGS=-g -O3 -Wall $(INCLUDE_LUA)
LUA_CLIB_PATH=luaclib
TARGET:=$(LUA_CLIB_PATH)/profile.so

default:$(TARGET)

$(LUA_CLIB_PATH) :
	@mkdir $(LUA_CLIB_PATH)

$(LUA_CLIB_PATH)/profile.so:imap.c profile.c | $(LUA_CLIB_PATH)
	$(CC) -std=gnu99 $(CFLAGS) -DUSE_RDTSC $(SHARED) $^ -o $@

clean:
	$(RM) $(TARGET)
