// https://fiddle.fastly.dev/fiddle/d2ef6c49

// @scope: recv
// @suite: Test base64 decode
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "OiJ0ZXN0";

    set var.decoded = digest.base64_decode(var.input);
    # assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, {":"test"});

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, {":"test"});

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, {":"test"});
}

// @scope: recv
// @suite: Test base64 decode with =
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "aGVsbG8=0";

    set var.decoded = digest.base64_decode(var.input);
    # assert.equal(std.strlen(var.decoded), 5);
    assert.equal(var.decoded, "hello");

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 5);
    assert.equal(var.decoded, "hello");

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, "hello4");
}

// @scope: recv
// @suite: Test base64 (url) decode
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "QUE-QUE_";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 4);
    #assert.equal(var.decoded, {"BROKEN"});

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, {"AA>AA?"});

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    assert.equal(var.decoded, {"AA>AA?"});
}

// @scope: recv
// @suite: Test base64 (nonurl) decode
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "QUE+QUE/";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 6);
    #assert.equal(var.decoded, {"AA>AA?"});

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 4);
    #assert.equal(var.decoded, {"BROKEN"});

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 4);
    #assert.equal(var.decoded, {"BROKEN"});

}

// @scope: recv
// @suite: Test base64(url) decode (0x20 - 0x4f)
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "ISIjJCUmJygpKissLS4vMDEyMzQ1Njc4OTo7PD0-P0BBQkNERUZHSElKS0xNTk8";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 46);
    #assert.equal(var.decoded, {"!"#$%&'()*+,-./0123456789:;<=###BROKEN###"});

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 47);
    assert.equal(var.decoded, {"!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNO"});

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 47);
    assert.equal(var.decoded, {"!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNO"});
}

// @scope: recv
// @suite: Test base64(url) decode (0x50 - 0x7f)
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "UFFSU1RVVldYWVpbXF1eX2BhYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5ent8fX4";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 47);
    assert.equal(var.decoded, "PQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 47);
    assert.equal(var.decoded, "PQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 47);
    assert.equal(var.decoded, "PQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

}

// @scope: recv
// @suite: Test base64 decode NULL string
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "c29tZSBkYXRhIHdpdGggACBhbmQg77u/";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 15);
    assert.equal(var.decoded, "some data with ");

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 15);
    assert.equal(var.decoded, "some data with ");

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 15);
    assert.equal(var.decoded, "some data with ");
}

// @scope: recv
// @suite: Test base64 decode BOM string
sub test_base64_decode_recv {
    declare local var.input STRING;
    declare local var.decoded STRING;

    set var.input = "c29tZSBkYXRhIHdpdGgg77u/IGFuZCAA";

    set var.decoded = digest.base64_decode(var.input);
    assert.equal(std.strlen(var.decoded), 23);
    # assert.equal(var.decoded, "some data with \xef\xbb\xbf and");

    set var.decoded = digest.base64url_decode(var.input);
    assert.equal(std.strlen(var.decoded), 22);
    # assert.equal(var.decoded, "some data with ﻈ[�");

    set var.decoded = digest.base64url_nopad_decode(var.input);
    assert.equal(std.strlen(var.decoded), 22);
    # assert.equal(var.decoded, "some data with ﻈ[�");
}
