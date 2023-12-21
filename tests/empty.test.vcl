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
}
