# https://fiddle.fastly.dev/fiddle/1128f1eb

// @scope: recv
// @suite: STRING with auto escape
sub test_string_recv {
    declare local var.str STRING;

    set var.str = "abc";  //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");

    set var.str = "%61%62%63";  //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");

    set var.str = "%u0061%u0062%u0063";  //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");

    set var.str = "%u{0061}%u{0062}%u{0063}"; //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");
}

// @scope: recv
// @suite: long STRING (without auto escape)
sub test_string_recv {
    declare local var.str STRING;

    set var.str = {"abc"};  //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");

    set var.str = {"%61%62%63"};  //%61%62%63
    assert.equal(std.strlen(var.str), 9);
    assert.equal(var.str, {"%61%62%63"});

    set var.str = {"%u0061%u0062%u0063"};  //%u0061%u0062%u0063
    assert.equal(std.strlen(var.str), 18);
    assert.equal(var.str, {"%u0061%u0062%u0063"});

    set var.str = {"%u{0061}%u{0062}%u{0063}"};  //%u{0061}%u{0062}%u{0063}
    assert.equal(std.strlen(var.str), 24);
    assert.equal(var.str, {"%u{0061}%u{0062}%u{0063}"});
}

// @scope: recv
// @suite: long STRING with heredoc delimiters
sub test_string_recv {
    declare local var.str STRING;

    # set var.str = {TEXT"%61%62%63"TEXT};  //%61%62%63
    assert.equal(std.strlen(var.str), 9);
    assert.equal(var.str, {"%61%62%63"});
}

// @scope: recv
// @suite: STRING with INVALID parcent encoding string
sub test_string_recv {
    declare local var.str STRING;
    //set var.str = "%error%";  // compile error
}

// @scope: recv
// @suite: STRING with urldecode function
sub test_string_recv {
    declare local var.str STRING;

    set var.str = urldecode("%2561%2562%2563");  //abc
    assert.equal(std.strlen(var.str), 3);
    assert.equal(var.str, "abc");

    set var.str = urldecode({"%2561%2562%2563"});  //%61%62%63
    assert.equal(std.strlen(var.str), 9);
    assert.equal(var.str, {"%61%62%63"});
}

// @scope: recv
// @suite: STRING with null string
sub test_string_recv {
    declare local var.str STRING;

    set var.str = "ab%00c";  //ab (len=2)
    assert.equal(std.strlen(var.str), 2);
    assert.equal(var.str, "ab");

    set var.str = urldecode({"ab%00c"});  //ab (len=2)
    assert.equal(std.strlen(var.str), 2);
    assert.equal(var.str, "ab");
}

// @scope: recv
// @suite: STRING surrogate pair
sub test_string_recv {
    declare local var.str STRING;

    set var.str = "👨‍👦‍👦";
    assert.equal(std.strlen(var.str), 18);
    assert.equal(var.str, "👨‍👦‍👦");
}
