const std = @import("std");

pub fn pow_f64(arg1: f64, arg2: f64) !f64 {
    return std.math.pow(f64, arg1, arg2);
}

// Gravitational constant
pub const G = 6.67408 * std.math.pow(f64, 10, -11);

// PI
pub const PI = 3.14159265358979323846;

// Stefan-Boltzmann constant
pub const StB = 5.670367 * std.math.pow(f64, 10, -8);

// bolometric correction coefficient for log Teff < 3.90
pub const BCA1 = -0.190537291496456 * pow_f64(10, 5);
pub const BCB1 = 0.155144866764412 * pow_f64(10, 5);
pub const BCC1 = -0.421278819301717 * pow_f64(10, 4);
pub const BCD1 = 0.381476328422343 * pow_f64(10, 3);

// bolometric correction coefficient for log Teff > 3.90
pub const BCA2 = -0.370510203809015 * pow_f64(10, 5);
pub const BCB2 = 0.385672629965804 * pow_f64(10, 5);
pub const BCC2 = -0.150651486316025 * pow_f64(10, 5);
pub const BCD2 = 0.261724637119416 * pow_f64(10, 4);
pub const BCE2 = -0.170623810323864 * pow_f64(10, 3);

// bolometric correction coefficient for log Teff > 3.90
pub const BCA3 = -0.118115450538963 * pow_f64(10, 6);
pub const BCB3 = 0.137145973583929 * pow_f64(10, 6);
pub const BCC3 = -0.636233812100225 * pow_f64(10, 5);
pub const BCD3 = 0.147412923562646 * pow_f64(10, 5);
pub const BCE3 = -0.170587278406872 * pow_f64(10, 4);
pub const BCF3 = 0.788731721804990 * pow_f64(10, 2);

// effective temperature function coefficient for typical stars
pub const VA = 3.979145106714099;
pub const VB = -0.654992268598245;
pub const VC = 1.740690042385095;
pub const VD = -4.608815154057166;
pub const VE = 6.792599779944473;
pub const VF = -5.396909891322525;
pub const VG = 2.192970376522490;
pub const VH = -0.359495739295671;

// effecrive temperature function coefficient for supergiants
pub const SA = 4.012559732366214;
pub const SB = -1.055043117465989;
pub const SC = 2.133394538571825;
pub const SD = -2.459769794654992;
pub const SE = 1.349423943497744;
pub const SF = -0.283942579112032;
