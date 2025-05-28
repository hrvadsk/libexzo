const std = @import("std");
const constant = @import("constants.zig");

// Surface gravity from mass+radius:
// derives the surface gravity in meters per second squared of an
// object from its mass and radius in kilograms and meters, respectively
pub fn surface_gravity(mass: f64, radius: f64) !f64 {
    return constant.G * (mass / (radius * radius));
}

// Radius from surface gravity + mass:
// derives the radius of an object in meters from its
// mass and surface gravity in kilograms and meters per second
// squared, respectively
pub fn radius_sg(gravity: f64, mass: f64) !f64 {
    return std.math.pow(f64, constant.G * (mass / gravity), 1.0 / 2.0);
}

// Mass from surface gravity + radius:
// derives the mass of an object in kilograms from its
// radius and surface gravity in meters and meters per
// second squared, respectively

pub fn mass_sg(gravity: f64, radius: f64) !f64 {
    return gravity * (radius * radius) / constant.G;
}
