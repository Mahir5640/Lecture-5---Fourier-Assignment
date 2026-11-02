# Lecture 5: Fourier Series, DTFT, and DFT Assignments

This repository contains MATLAB exercises investigating Fourier approximations, the Fast Fourier Transform (FFT), spectral leakage, and the relationship between the DTFT and DFT.

---

## Exercise 1: Build a Square Wave from Harmonics

### Prediction
As more odd harmonics ($H$) are added, the reconstructed waveform will become progressively sharper and closer to an ideal square wave. The flat horizontal sections will flatten out, but ripples and overshoots/undershoots will appear near the sharp transitions due to the Gibbs phenomenon.

### Explanation & Observations
* **Changes as $H$ increases:** At $H = 1$, the waveform is a pure sinusoid. As $H$ increases to 3, 9, and 25, the waveform steepens at the edges and develops flatter plateaus.
* **Near sharp transitions:** We observe pronounced overshoots and undershoots (Gibbs phenomenon) right at the discontinuities. The peak overshoot remains around 9% regardless of how large $H$ becomes, but the ripples become narrower and compressed closer to the edge.

---

## Exercise 2: Find Two Frequencies with the FFT

### Predictions & Expected Values
* **Expected Frequencies:** $15\text{ Hz}$ and $40\text{ Hz}$.
* **Expected Amplitudes:** $0.8$ and $0.4$.

### Frequency-Bin Spacing Calculation
* Sampling frequency: $f_s = 200\text{ Hz}$
* Number of samples: $N = f_s \times T = 200 \times 1 = 200$
* Bin spacing: 
  $$\Delta f = \frac{f_s}{N} = \frac{200}{200} = 1.0\text{ Hz}$$

### Comparison
The measured spectrum shows sharp peaks precisely at $15\text{ Hz}$ and $40\text{ Hz}$ with amplitudes matching $0.8$ and $0.4$ respectively. Because both frequencies align perfectly with the DFT frequency grid ($15$ and $40$ are integer multiples of $\Delta f = 1\text{ Hz}$), no spectral leakage occurs.

---

## Exercise 3: Investigate Spectral Leakage

* **Last digit of student number ($d$):** 4
* **Calculated secondary frequency ($f_2$):** 
  $$f_2 = 13.2 + 0.17 \times 4 = 13.8\text{ Hz}$$

### Prediction
Because $13.8\text{ Hz}$ is not an integer multiple of the $1\text{ Hz}$ bin spacing, its energy will not fall cleanly into a single bin. Instead, it will spread across neighboring bins (spectral leakage), resulting in a lower peak height and wider peak profile.

### Observations & Explanations
1. **1-Second Recording ($\Delta f = 1\text{ Hz}$):** The $13.8\text{ Hz}$ peak appears broadened and reduced in amplitude because its energy leaks into adjacent frequency bins.
2. **4-Second Recording ($\Delta f = 0.25\text{ Hz}$):** The bin spacing decreases to $0.25\text{ Hz}$. The peak becomes narrower and taller because the finer resolution bins capture the energy more compactly, though slight leakage persists because $13.8\text{ Hz}$ is still not a clean multiple of $0.25\text{ Hz}$ ($13.8 / 0.25 = 55.2$).
3. **Zero-Padding (`fft(x, 4*length(x))`):** Zero-padding interpolates the frequency spectrum, making the curve look smooth and continuous. However, it **does not** add new information or improve actual frequency resolution; it merely visualizes the underlying DFT interpolation envelope.

---

## Exercise 4: Compare the DTFT and DFT

### Answers to Tasks 4–6
* **Task 4 (Comparison):** The continuous DTFT is a smooth curve representing the frequency response for all continuous angular frequencies $\omega \in [-\pi, \pi]$. The 4-point DFT values (`fft(x,4)`) evaluate this continuous DTFT curve at 4 discrete points ($\omega_k = k \frac{2\pi}{4}$).
* **Task 5 (`fft(x,64)` vs `fft(x,4)`):** `fft(x,64)` computes 64 points instead of 4 by implicitly zero-padding the 4-sample sequence in the time domain up to length 64. **No new time-domain samples or information are added**; it simply samples the continuous DTFT at a much finer grid of 64 points, creating a smoother curve that closely overlays the DTFT plot.
* **Task 6 (Zeros of DTFT):** For the sequence $x = [1, 1, 1, 1]$, the DTFT is given by:
  $$X(e^{j\omega}) = e^{-j 1.5\omega} \frac{\sin(2\omega)}{\sin(\omega/2)}$$
  The magnitude becomes zero where the numerator $\sin(2\omega) = 0$ while the denominator $\sin(\omega/2) \neq 0$. This occurs at angular frequencies $\omega = \pm \frac{\pi}{2}, \pm \pi$ (excluding $\omega = 0$ where the limit equals 4).

---

## AI Usage Note
AI tools were used to understand MATLAB syntax, structure the plotting scripts efficiently, and verify theoretical calculations for spectral leakage and DTFT zero-crossings. All code was reviewed, tested, and executed independently.
