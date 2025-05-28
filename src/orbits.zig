const std = @import("std");
const constant = @import("constants.zig");

// Semimajor Axis + combined mass to orbital period:
// converts an orbit`s semimajor axis (in meters) to an
// orbital period (in seconds), factoring in the combined
// mass of both host and satellite
pub fn period(semimajo_raxis: f64, host_mass: f64, sat_mass: f64) !f64 {
    const m: f64 = @abs(host_mass + sat_mass);
    const t_numerator: f64 = 4.0 * std.math.pow(f64, constant.PI, 2.0) * std.math.pow(f64, @abs(semimajo_raxis), 3.0);
    const t_denominator: f64 = constant.G * m;
    const t: f64 = std.math.sqrt(t_numerator / t_denominator);

    return t;
}

// Orbital period + combines mass to semimajor axis:
// converts to an orbit`s period (in seconds) to a
// semimajor axis (in meters), factoring in combined
// mass of both host and sattelite
pub fn sma(period_arg: f64, host_mass: f64, sat_mass: f64) !f64 {
    const m: f64 = @abs(host_mass + sat_mass);
    const r_numenator: f64 = constant.G * m * std.math.pow(f64, @abs(period_arg), 2.0);
    const r_denominator: f64 = 4 * std.math.pow(f64, constant.PI, 2.0);
    const r: f64 = std.math.pow(f64, r_numenator / r_denominator, 1.0 / 3.0);

    return r;
}

// Combined mass caclucaltion based on semimajor axis:
// uses the semimajor axis (in meters) and period of an
// orbit (in seconds) to approximate the combines mass
// of host and satellite
pub fn mass(semimajor_axis: f64, period_arg: f64) !f64 {
    const m_numenator: f64 = 4 * std.math.pow(f64, constant.PI, 2.0) * std.math.pow(f64, @abs(semimajor_axis), 3.0);
    const m_denominator: f64 = constant.G * std.math.pow(f64, @abs(period_arg), 2.0);
    const m: f64 = m_numenator / m_denominator;

    return m;
}

// Perihelion distance:
// unit-agnostic function that calculates the distance of a celestial
// body to its host at a perihelion based on its semimajor axis and eccentricty
pub fn perihelion(semimajor_axis: f64, eccentricity: f64) !f64 {
    const r: f64 = semimajor_axis * (1.0 - eccentricity);

    return r;
}

// Aphelion distance:
// unit-agnostic function that calculates the distance of a celestial
// body to its host at aphelion based on its semimajor axis and eccentricity
pub fn aphelion(semimajor_axis: f64, eccentricity: f64) !f64 {
    const r: f64 = semimajor_axis * (1 + eccentricity);

    return r;
}
