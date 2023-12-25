// @scope: recv
// @suite: EMPTY var
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    declare local var.EMPTY STRING;
    set var.EMPTY = "";

    if(!var.EMPTY){set var.is_null = true;}else{set var.is_null = false;}
    if(var.EMPTY==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(var.EMPTY==var.EMPTY){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(var.EMPTY), 0);
    assert.false(var.is_null);
    assert.true(var.is_empty);
    assert.true(var.is_equal);

    set req.http.MESSAGE = "EMPTY var:" var.EMPTY "-" std.strlen(var.EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "EMPTY var:-0-0-1-1");
}

// @scope: recv
// @suite: EMPTY header
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    set req.http.EMPTY = "";

    if(!req.http.EMPTY){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.EMPTY==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.EMPTY==req.http.EMPTY){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.EMPTY), 0);
    assert.false(var.is_null);
    assert.true(var.is_empty);
    assert.true(var.is_equal);

    set req.http.MESSAGE = "EMPTY header:" req.http.EMPTY "-" std.strlen(req.http.EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "EMPTY header:-0-0-1-1");
}

// @scope: recv
// @suite: EMPTY VARS
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    set req.http.VARS = "";
    set req.http.VARS:EMPTY = "V";
    set req.http.VARS:EMPTY = "";

    if(!req.http.VARS:EMPTY){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.VARS:EMPTY==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.VARS:EMPTY==req.http.VARS:EMPTY){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.VARS:EMPTY), 0);
    assert.false(var.is_null);
    assert.true(var.is_empty);
    assert.true(var.is_equal);

    set req.http.MESSAGE = "EMPTY VARS:" req.http.VARS:EMPTY "-" std.strlen(req.http.VARS:EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "EMPTY VARS:-0-0-1-1");
}

// @scope: recv
// @suite: NOTSET var
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    declare local var.NOTSET STRING;

    if(!var.NOTSET){set var.is_null = true;}else{set var.is_null = false;}
    if(var.NOTSET==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(var.NOTSET==var.NOTSET){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(var.NOTSET), 0);
    assert.true(var.is_null);
    assert.false(var.is_empty);
    assert.false(var.is_equal);

    set req.http.MESSAGE = "NOTSET var:" var.NOTSET "-" std.strlen(var.NOTSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "NOTSET var:(null)-0-1-0-0");
}

// @scope: recv
// @suite: UNDEF header
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    if(!req.http.UNDEF){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.UNDEF==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.UNDEF==req.http.UNDEF){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.UNDEF), 0);
    assert.true(var.is_null);
    assert.false(var.is_empty);
    assert.false(var.is_equal);

    set req.http.MESSAGE = "UNDEF header:" req.http.UNDEF "-" std.strlen(req.http.UNDEF) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "UNDEF header:(null)-0-1-0-0");
}

// @scope: recv
// @suite: UNDEF VARS
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    if(!req.http.VARS:UNDEF){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.VARS:UNDEF==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.VARS:UNDEF==req.http.VARS:UNDEF){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.VARS:UNDEF), 0);
    assert.true(var.is_null);
    assert.false(var.is_empty);
    assert.false(var.is_equal);

    set req.http.MESSAGE = "UNDEF VARS:" req.http.VARS:UNDEF "-" std.strlen(req.http.VARS:UNDEF) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "UNDEF VARS:(null)-0-1-0-0");
}

// @scope: recv
// @suite: UNSET header
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    set req.http.UNSET = "V";
    unset req.http.UNSET;

    if(!req.http.UNSET){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.UNSET==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.UNSET==req.http.UNSET){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.UNSET), 0);
    assert.true(var.is_null);
    assert.false(var.is_empty);
    assert.false(var.is_equal);

    set req.http.MESSAGE = "UNSET header:" req.http.UNSET "-" std.strlen(req.http.UNSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "UNSET header:(null)-0-1-0-0");
}

// @scope: recv
// @suite: UNSET VARS
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    set req.http.VARS = "";
    set req.http.VARS:UNSET = "V";
    unset req.http.VARS:UNSET;

    if(!req.http.VARS:UNSET){set var.is_null = true;}else{set var.is_null = false;}
    if(req.http.VARS:UNSET==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(req.http.VARS:UNSET==req.http.VARS:UNSET){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(req.http.VARS:UNSET), 0);
    assert.true(var.is_null);
    assert.false(var.is_empty);
    assert.false(var.is_equal);

    set req.http.MESSAGE = "UNSET VARS:" req.http.VARS:UNSET "-" std.strlen(req.http.VARS:UNSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "UNSET VARS:(null)-0-1-0-0");
}


// @scope: recv
// @suite: SETNULL(EMPTY) var
sub test_empty_recv {
    declare local var.is_null BOOL;
    declare local var.is_empty BOOL;
    declare local var.is_equal BOOL;

    declare local var.SETNULL STRING;  # This process fails and results in EMPTY

    set var.SETNULL = req.http.UNDEF;

    if(!var.SETNULL){set var.is_null = true;}else{set var.is_null = false;}
    if(var.SETNULL==""){set var.is_empty = true;}else{set var.is_empty = false;}
    if(var.SETNULL==var.SETNULL){set var.is_equal = true;}else{set var.is_equal = false;}
    assert.equal(std.strlen(var.SETNULL), 0);
    assert.false(var.is_null);
    assert.true(var.is_empty);
    assert.true(var.is_equal);

    set req.http.MESSAGE = "SETNULL(fail) var:" var.SETNULL "-" std.strlen(var.SETNULL) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(req.http.MESSAGE, "SETNULL(fail) var:-0-0-1-1");
}


// @scope: recv
// @suite: CONCAT not_set value
sub test_empty_recv {
    declare local var.NOTSET STRING;
    declare local var.message STRING;

    set req.http.MESSAGE = var.NOTSET;
    assert.equal(req.http.MESSAGE, "[not set]");

    set var.message = var.NOTSET;
    assert.equal(var.message, "");

    set req.http.MESSAGE = "var:" var.NOTSET;
    assert.equal(req.http.MESSAGE, "var:(null)");

    set var.message = "var:" var.NOTSET;
    assert.equal(var.message, "var:");
}
