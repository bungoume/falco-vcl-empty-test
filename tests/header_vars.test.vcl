// @scope: recv
// @suite: UNSET VARS ALL VALUE
sub test_recv {
    set req.http.VARS = "";
    set req.http.VARS:VALUE = "V";
    unset req.http.VARS:VALUE;
    assert.is_notset(req.http.VARS);
}

// @scope: recv
// @suite: UNSET VARS VALUE
sub test_recv {
    set req.http.VARS = "";
    set req.http.VARS:VALUE = "V";
    set req.http.VARS:VALUE2 = "V2";
    unset req.http.VARS:VALUE;
    assert.equal(req.http.VARS, "VALUE2=V2");
}

// @scope: recv
// @suite: EMPTY VARS VALUE
sub test_recv {
    set req.http.VARS = "";
    set req.http.VARS:VALUE = "";
    assert.equal(req.http.VARS, "VALUE");
}

// @scope: recv
// @suite: OVERRIDE VARS VALUE
sub test_recv {
    set req.http.VARS = "";
    set req.http.VARS:VALUE = "V";
    set req.http.VARS:VALUE = "O";
    assert.equal(req.http.VARS, "VALUE=O");
}
