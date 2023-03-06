# Communication-System-Using-16APSK

:::info
:bulb: Capstone Course for Analysis and Design of Communication Systems
:::

[TOC]

---

![](https://i.imgur.com/HAHN3Pv.png)

## Simulated 16-apsk transmission system
### Tx
- Message
    1. Change text to bit
    2. Downsampler Timing Offset

- Encode
    1. Converting bits into decimal values for mapping
    2. Mapping the values onto the correspondant constellation points
    ![](https://i.imgur.com/P6PHVgq.png)


- Up sampling and Pulse shaping
    1. Zero pad T-spaced symbol sequence to create upsampled
    2. Up sample
    3. Build pulse of width using srrc
    ![](https://i.imgur.com/Q1Tv2Uv.png)

    4. Plot eye patern of In-phase signal
    ![](https://i.imgur.com/MhDEXG2.png)

    5. Spectrum of the pulse shape
    ![](https://i.imgur.com/FKP3Nfh.png)

- Transmit
    ![](https://i.imgur.com/mrCiuHo.png)

### Channel

- Time varying fading channel
![](https://i.imgur.com/yVHswYp.png)

### Receiver

- Before BPF
![](https://i.imgur.com/GIXsZNh.png)

- After BPF
![](https://i.imgur.com/ciKar8S.png)

- Demodulating signal in I-phase
![](https://i.imgur.com/KO5fsko.png)

- A mixer with phase adaptation via Preprocessing and PLL
    ![](https://i.imgur.com/jvW4dB9.png)
    1. Baseband Derotation
    ![](https://i.imgur.com/m5ki5gR.png)


- Lowpass filtering for downconversion, matched filter, and interpolation all provided by a matched filter with adjusted timing offset adapted with maximization of the fourth power of downsampled signals in dual-loop configuration
    ![](https://i.imgur.com/g70MsAZ.png)
    1. Time Recovery
    ![](https://i.imgur.com/oYmRyQK.png)
    ![](https://i.imgur.com/1L1Xrit.png)

- Linear equalizer adaptation via LMS; switched to decision-directed LMSadaptation during the data (i.e. non-training) portion
    - Decision device and symbol matching performance assessment
    ![](https://i.imgur.com/ynXDeMf.png)
    - Quantize
    ![](https://i.imgur.com/GMsGTgt.png)
    ![](https://i.imgur.com/OL3z8z2.png)

- Decode
Calculate different bits in total:
```
    different_bits = 2
    pererr = 0.0556
```
