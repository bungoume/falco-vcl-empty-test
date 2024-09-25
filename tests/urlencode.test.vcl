# https://fiddle.fastly.dev/fiddle/64edc862


// @scope: recv
// @suite: STRING urlencode 00
sub test_string_recv {
    declare local var.str STRING;

    set var.str = urlencode("%00");
    assert.equal(std.strlen(var.str), 0);
    assert.equal(var.str, {""});

    set var.str = urlencode("ab%00c");
    assert.equal(std.strlen(var.str), 2);
    assert.equal(var.str, {"ab"});
}

// @scope: recv
// @suite: STRING urlencode 01-0F
sub test_string_recv {
    declare local var.str STRING;

    set var.str = urlencode("%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F");
    assert.equal(std.strlen(var.str), 45);
    assert.equal(var.str, {"%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F"});
}

// @scope: recv
// @suite: STRING urlencode 10-1F
sub test_string_recv {
    declare local var.str STRING;

    set var.str = urlencode("%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F");
    assert.equal(std.strlen(var.str), 48);
    assert.equal(var.str, {"%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F"});
}

// @scope: recv
// @suite: STRING urlencode 20-2F
sub test_string_recv {
    declare local var.str STRING;

    set var.str = urlencode({" !"#$%&'()*+,-./"});
    assert.equal(std.strlen(var.str), 44);
    assert.equal(var.str, {"%20%21%22%23%24%25%26%27%28%29%2A%2B%2C-.%2F"});
}

// @scope: recv
// @suite: STRING urlencode 30-3F
sub test_string_recv {
    declare local var.str STRING;
    set var.str = urlencode({"0123456789:;<=>?"});
    assert.equal(std.strlen(var.str), 28);
    assert.equal(var.str, {"0123456789%3A%3B%3C%3D%3E%3F"});
}

// @scope: recv
// @suite: STRING urlencode 40-5F
sub test_string_recv {
    declare local var.str STRING;
    set var.str = urlencode({"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"});
    assert.equal(std.strlen(var.str), 45);
    assert.equal(var.str, {"%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5C%5D%5E_"});
}

// @scope: recv
// @suite: STRING urlencode 60-7E
sub test_string_recv {
    declare local var.str STRING;
    set var.str = urlencode({"`abcdefghijklmnopqrstuvwxyz{|}~"});
    assert.equal(std.strlen(var.str), 39);
    assert.equal(var.str, {"%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~"});
}

// @scope: recv
// @suite: STRING urlencode 7F
sub test_string_recv {
    declare local var.str STRING;
    set var.str = urlencode("%7F");
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, {"%7F"});
}
