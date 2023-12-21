// @scope: recv
// @suite: default value check
sub test_default_local_var_recv {
    declare local var.is_null BOOL;

    declare local var.bool BOOL;
    declare local var.integer INTEGER;
    declare local var.float FLOAT;
    declare local var.string STRING;
    declare local var.time TIME;
    declare local var.rtime RTIME;
    declare local var.ip IP;

    assert.false(var.bool);
    assert.equal(var.integer, 0);
    assert.equal(var.float, 0.000);
    assert.equal(var.time, std.time("Thu, 01 Jan 1970 00:00:00 GMT", now));
    assert.equal(var.rtime, 0s);
    # assert.equal(var.ip, 0);

    if(!var.string){set var.is_null = true;}else{set var.is_null = false;}
    assert.true(var.is_null);
    assert.not_equal(var.string, "");
}
