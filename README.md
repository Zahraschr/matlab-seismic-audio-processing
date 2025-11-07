# MATLAB Seismic and Audio Signal Processing

This project includes MATLAB scripts for reading and visualizing SAC seismic data, generating rotating stereo audio, and performing FFT-based noise reduction. All scripts are fully runnable and ready to use.

---

## Features

- **Read SAC Files**  
  Uses `rdsac.m` function to import SAC time series data and metadata.

- **Seismic Signal Visualization**  
  Plots waveform data and power spectrum for three seismic stations (HARP, PAX, and WANC).

- **Rotating Audio Source Simulation**  
  Generates a stereo audio output (`out_audio.wav`) where the sound position moves from left to right.

- **FFT Noise Reduction**  
  Loads a noisy signal from `.mat` file, identifies dominant frequencies, and reconstructs a cleaner signal.

---

## File Descriptions

| File | Description |
|------|-------------|
| `main_plot_sac.m` | Reads and plots SAC data + power spectra. |
| `rdsac.m` | Reads SAC seismic files and extracts metadata. |
| `audio_panner.m` | Generates rotating-panning stereo audio signal. |
| `fft_denoise_demo.m` | Removes noise using FFT thresholding and plots detected peaks. |
| `out_audio.wav` | Output audio (created after running `audio_panner.m`). |
| `datafile.mat` | Input file for FFT demo (must contain `x_noise`). |

---

## Requirements

- MATLAB R2018 or newer
- Signal Processing Toolbox (recommended)

---

## How to Run

### 1. Plot Seismic Signals
```matlab
main_plot_sac
