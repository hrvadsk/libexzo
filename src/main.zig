const std = @import("std");
const constant = @import("constants.zig");
const star = @import("stars.zig");
const orbit = @import("orbits.zig");
const planet = @import("planets.zig");

pub fn main() !void {
    // Suffering for sin of using Winndows
    const stdout = std.io.getStdOut().writer();

    const test1: f64 = try planet.surface_gravity(100.0, 200.0);
    const test2: f64 = try planet.radius_sg(100.0, 200.0);
    const test3: f64 = try planet.mass_sg(100.0, 200.0);

    try stdout.print("{d}\n", .{test1});
    try stdout.print("{d}\n", .{test2});
    try stdout.print("{d}\n", .{test3});
}
