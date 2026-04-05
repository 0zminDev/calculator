const std = @import("std");

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add positive int" {
    const result = add(2, 3);
    try std.testing.expect(result == 5);
}

test "add negative int" {
    const result = add(-2, -3);
    try std.testing.expect(result == -5);
}

test "add mixed int" {
    const result = add(-2, 3);
    try std.testing.expect(result == 1);
}
