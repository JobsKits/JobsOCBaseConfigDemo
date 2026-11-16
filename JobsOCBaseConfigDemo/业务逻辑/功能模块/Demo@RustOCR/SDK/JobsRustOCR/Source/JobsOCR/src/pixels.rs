use crate::runtime::Result;

#[derive(Clone)]
pub struct Gray {
    pub width: usize,
    pub height: usize,
    pub pixels: Vec<u8>,
}

impl Gray {
    pub fn rgba(data: &[u8], width: usize, height: usize, stride: usize) -> Result<Self> {
        if width == 0 || height == 0 || width > 20_000 || height > 20_000 {
            return Err("Invalid image dimensions".into());
        }
        let count = width
            .checked_mul(height)
            .ok_or("Image dimensions overflow")?;
        if count > 24_000_000
            || stride < width * 4
            || data.len() < stride.checked_mul(height).ok_or("Image stride overflow")?
        {
            return Err("Image exceeds 24 megapixels or buffer/stride is invalid".into());
        }
        let mut pixels = Vec::with_capacity(count);
        for row in data.chunks(stride).take(height) {
            for p in row[..width * 4].chunks_exact(4) {
                let gray =
                    (4899_u32 * p[0] as u32 + 9617 * p[1] as u32 + 1868 * p[2] as u32 + 8192) >> 14;
                pixels.push(gray.min(255) as u8);
            }
        }
        Ok(Self {
            width,
            height,
            pixels,
        })
    }

    pub fn resized(&self, width: usize, height: usize) -> Self {
        let mut pixels = vec![255; width * height];
        let sx = self.width as f64 / width as f64;
        let sy = self.height as f64 / height as f64;
        for y in 0..height {
            for x in 0..width {
                let value = if sx > 1.0 && sy > 1.0 {
                    let (x0, x1, y0, y1) = (
                        x as f64 * sx,
                        (x + 1) as f64 * sx,
                        y as f64 * sy,
                        (y + 1) as f64 * sy,
                    );
                    let mut total = 0.0;
                    for iy in y0.floor() as usize..y1.ceil() as usize {
                        let wy = (y1.min((iy + 1) as f64) - y0.max(iy as f64)).max(0.0);
                        for ix in x0.floor() as usize..x1.ceil() as usize {
                            let wx = (x1.min((ix + 1) as f64) - x0.max(ix as f64)).max(0.0);
                            total += wx
                                * wy
                                * self.pixels
                                    [iy.min(self.height - 1) * self.width + ix.min(self.width - 1)]
                                    as f64;
                        }
                    }
                    total / (sx * sy)
                } else {
                    self.bilinear((x as f64 + 0.5) * sx - 0.5, (y as f64 + 0.5) * sy - 0.5)
                };
                pixels[y * width + x] = value.round().clamp(0.0, 255.0) as u8;
            }
        }
        Self {
            width,
            height,
            pixels,
        }
    }

    fn bilinear(&self, x: f64, y: f64) -> f64 {
        let x = x.clamp(0.0, (self.width - 1) as f64);
        let y = y.clamp(0.0, (self.height - 1) as f64);
        let (ix, iy) = (x.floor() as usize, y.floor() as usize);
        let (fx, fy) = (x - ix as f64, y - iy as f64);
        let a = self.pixels[iy * self.width + ix] as f64;
        let b = self.pixels[iy * self.width + (ix + 1).min(self.width - 1)] as f64;
        let c = self.pixels[(iy + 1).min(self.height - 1) * self.width + ix] as f64;
        let d = self.pixels
            [(iy + 1).min(self.height - 1) * self.width + (ix + 1).min(self.width - 1)]
            as f64;
        (a * (1.0 - fx) + b * fx) * (1.0 - fy) + (c * (1.0 - fx) + d * fx) * fy
    }

    pub fn thumbnail(&self, side: usize) -> Self {
        if self.width.max(self.height) <= side {
            return self.clone();
        }
        let scale = side as f64 / self.width.max(self.height) as f64;
        self.resized(
            (self.width as f64 * scale).round_ties_even().max(1.0) as usize,
            (self.height as f64 * scale).round_ties_even().max(1.0) as usize,
        )
    }

    pub fn rotate_quarters(&self, clockwise: usize) -> Self {
        let mut result = self.clone();
        for _ in 0..clockwise % 4 {
            let mut pixels = vec![255; result.pixels.len()];
            for y in 0..result.height {
                for x in 0..result.width {
                    pixels[x * result.height + result.height - 1 - y] =
                        result.pixels[y * result.width + x];
                }
            }
            result = Self {
                width: result.height,
                height: result.width,
                pixels,
            };
        }
        result
    }

    pub fn rotated(&self, angle: f64) -> Self {
        let a = angle.to_radians();
        let (sin, cos) = a.sin_cos();
        let (cx, cy) = (self.width as f64 / 2.0, self.height as f64 / 2.0);
        let mut pixels = vec![255; self.pixels.len()];
        for y in 0..self.height {
            for x in 0..self.width {
                let (dx, dy) = (x as f64 - cx, y as f64 - cy);
                pixels[y * self.width + x] = self
                    .bilinear(cos * dx - sin * dy + cx, sin * dx + cos * dy + cy)
                    .round() as u8;
            }
        }
        Self {
            width: self.width,
            height: self.height,
            pixels,
        }
    }

    pub fn ink_square(&self, side: usize) -> Vec<f32> {
        let scale = side as f64 / self.width.max(self.height) as f64;
        let small = self.resized(
            (self.width as f64 * scale).round_ties_even().max(1.0) as usize,
            (self.height as f64 * scale).round_ties_even().max(1.0) as usize,
        );
        let mut out = vec![0.0; side * side];
        for y in 0..small.height {
            for x in 0..small.width {
                out[y * side + x] = 1.0 - small.pixels[y * small.width + x] as f32 / 255.0;
            }
        }
        out
    }

    pub fn detector_input(&self, side: usize) -> (Vec<usize>, Vec<f32>, f32) {
        let scale = side as f64 / self.width.max(self.height) as f64;
        let small = self.resized(
            (self.width as f64 * scale).round_ties_even().max(1.0) as usize,
            (self.height as f64 * scale).round_ties_even().max(1.0) as usize,
        );
        let (w, h) = (
            small.width.div_ceil(32) * 32,
            small.height.div_ceil(32) * 32,
        );
        let mut out = vec![0.0; w * h];
        for y in 0..small.height {
            for x in 0..small.width {
                out[y * w + x] = 1.0 - small.pixels[y * small.width + x] as f32 / 255.0;
            }
        }
        (vec![1, 1, h, w], out, scale as f32)
    }

    pub fn crop_line(
        &self,
        box_: [f32; 4],
        line_height: usize,
        window: usize,
    ) -> (usize, Vec<f32>) {
        let [x0, y0, x1, y1] = box_;
        let line_h = (y1 - y0).max(1.0);
        let pad_y = (window as f32 * 1.4 - 1.0) / 2.0;
        let left = (x0 - 0.3 * line_h).floor() as isize;
        let top = (y0 - pad_y * line_h).floor() as isize;
        let right = (x1 + 0.3 * line_h).ceil() as isize;
        let bottom = (y1 + pad_y * line_h).ceil() as isize;
        let (cw, ch) = (
            (right - left).max(1) as usize,
            (bottom - top).max(1) as usize,
        );
        let mut histogram = [0usize; 256];
        for y in (y0.max(0.0) as usize)..((y1 + 1.0).max(0.0) as usize).min(self.height) {
            for x in (x0.max(0.0) as usize)..((x1 + 1.0).max(0.0) as usize).min(self.width) {
                histogram[self.pixels[y * self.width + x] as usize] += 1;
            }
        }
        let count = histogram.iter().sum::<usize>();
        let percentile = |q: f64| -> f64 {
            let rank = q * count.saturating_sub(1) as f64;
            let mut sum = 0;
            for (i, n) in histogram.iter().enumerate() {
                sum += n;
                if sum as f64 > rank {
                    return i as f64;
                }
            }
            255.0
        };
        let (lo, med, hi) = (percentile(0.02), percentile(0.5), percentile(0.98));
        let dark = hi - med > 2.0 * (med - lo) + 8.0;
        let mut pixels = vec![if dark { 0 } else { 255 }; cw * ch];
        for y in 0..ch {
            for x in 0..cw {
                let (sx, sy) = (left + x as isize, top + y as isize);
                if sx >= 0 && sy >= 0 && sx < self.width as isize && sy < self.height as isize {
                    pixels[y * cw + x] = self.pixels[sy as usize * self.width + sx as usize];
                }
            }
        }
        let height = line_height * window;
        let width =
            ((cw as f64 * height as f64 / ch as f64).round_ties_even() as usize).clamp(8, 4096);
        let resized = Self {
            width: cw,
            height: ch,
            pixels,
        }
        .resized(width, height);
        let padded = width.max(32).div_ceil(8) * 8;
        let mut out = vec![0.0; padded * height];
        for y in 0..height {
            for x in 0..width {
                let value = resized.pixels[y * width + x] as f32 / 255.0;
                out[y * padded + x] = if dark { value } else { 1.0 - value };
            }
        }
        (width, out)
    }
}
