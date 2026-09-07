import lygia::generative::snoise::snoise;
import lygia::generative::gnoise::gnoise;

/*
contributors: Patricio Gonzalez Vivo
description: Fractal Brownian Motion
use: fbm(<vec2> pos)
options:
    FBM_OCTAVES: numbers of octaves. Default is 4.
    FBM_NOISE_FNC(UV): noise function to use Default 'snoise(UV)' (simplex noise)
    FBM_VALUE_INITIAL: initial value. Default is 0.
    FBM_SCALE_SCALAR: scalar. Default is 2.
    FBM_AMPLITUDE_INITIAL: initial amplitude value. Default is 0.5
    FBM_AMPLITUDE_SCALAR: amplitude scalar. Default is 0.5
examples:
    - /shaders/generative_fbm.frag
license:
    - Copyright (c) 2021 Patricio Gonzalez Vivo under Prosperity License - https://prosperitylicense.com/versions/3.0.0
    - Copyright (c) 2021 Patricio Gonzalez Vivo under Patron License - https://lygia.xyz/license
*/

const FBM_OCTAVES: f32 = 4;

const FBM_VALUE_INITIAL: f32 = 0.0;

const FBM_SCALE_SCALAR: f32 = 2.0;

const FBM_AMPLITUDE_INITIAL: f32 = 0.5;

const FBM_AMPLITUDE_SCALAR: f32 = 0.5;

fn fbm(st: vec2f) -> f32 {
    // Initial values
    let value = FBM_VALUE_INITIAL;
    let amplitude = FBM_AMPLITUDE_INITIAL;

    // Loop of octaves
    for (var i = 0; i < FBM_OCTAVES; i++) {
        value += amplitude * snoise(st);
        st *= FBM_SCALE_SCALAR;
        amplitude *= FBM_AMPLITUDE_SCALAR;
    }
    return value;
}

fn fbm(pos: vec3f) -> f32 {
    // Initial values
    let value = FBM_VALUE_INITIAL;
    let amplitude = FBM_AMPLITUDE_INITIAL;

    // Loop of octaves
    for (var i = 0; i < FBM_OCTAVES; i++) {
        value += amplitude * snoise(pos);
        pos *= FBM_SCALE_SCALAR;
        amplitude *= FBM_AMPLITUDE_SCALAR;
    }
    return value;
}

fn fbm(p: vec3f, tileLength: f32) -> f32 {
    let persistence = 0.5;
    let lacunarity = 2.0;

    let amplitude = 0.5;
    let total = 0.0;
    let normalization = 0.0;

    for (var i = 0; i < FBM_OCTAVES; i++) {
        let noiseValue = gnoise(p, tileLength * lacunarity * 0.5) * 0.5 + 0.5;
        total += noiseValue * amplitude;
        normalization += amplitude;
        amplitude *= persistence;
        p = p * lacunarity;
    }

    return total / normalization;
}
