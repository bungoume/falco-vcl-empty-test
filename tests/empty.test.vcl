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

    declare local var.message STRING;
    set var.message = "EMPTY var:" var.EMPTY "-" std.strlen(var.EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "EMPTY var:-0-0-1-1");
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
    #assert.equal(std.strlen(req.http.EMPTY), 0);
    #assert.false(var.is_null);
    #assert.true(var.is_empty);
    #assert.true(var.is_equal);

    declare local var.message STRING;
    set var.message = "EMPTY header:" req.http.EMPTY "-" std.strlen(req.http.EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "EMPTY header:-0-0-1-1");
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
    #assert.equal(std.strlen(req.http.VARS:EMPTY), 0);
    #assert.false(var.is_null);
    #assert.true(var.is_empty);
    #assert.true(var.is_equal);

    declare local var.message STRING;
    set var.message = "EMPTY VARS:" req.http.VARS:EMPTY "-" std.strlen(req.http.VARS:EMPTY) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "EMPTY VARS:-0-0-1-1");
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

    declare local var.message STRING;
    set var.message = "NOTSET var:" var.NOTSET "-" std.strlen(var.NOTSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "NOTSET var:-0-1-0-0");
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

    declare local var.message STRING;
    set var.message = "UNDEF header:" req.http.UNDEF "-" std.strlen(req.http.UNDEF) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "UNDEF header:-0-1-0-0");
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

    declare local var.message STRING;
    set var.message = "UNDEF VARS:" req.http.VARS:UNDEF "-" std.strlen(req.http.VARS:UNDEF) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "UNDEF VARS:-0-1-0-0");
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
    #assert.equal(std.strlen(req.http.UNSET), 0);
    #assert.true(var.is_null);
    #assert.false(var.is_empty);
    #assert.false(var.is_equal);

    declare local var.message STRING;
    set var.message = "UNSET header:" req.http.UNSET "-" std.strlen(req.http.UNSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "UNSET header:-0-1-0-0");
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
    #assert.equal(std.strlen(req.http.VARS:UNSET), 0);
    #assert.true(var.is_null);
    #assert.false(var.is_empty);
    #assert.false(var.is_equal);

    declare local var.message STRING;
    set var.message = "UNSET VARS:" req.http.VARS:UNSET "-" std.strlen(req.http.VARS:UNSET) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "UNSET VARS:-0-1-0-0");
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

    declare local var.message STRING;
    set var.message = "SETNULL(fail) var:" var.SETNULL "-" std.strlen(var.SETNULL) "-" var.is_null "-" var.is_empty "-" var.is_equal;
    assert.equal(var.message, "SETNULL(fail) var:-0-0-1-1");
}
