#Load Packages
library(soundecology)
library(tuneR)
library(ineq)
library(vegan)
library(parallel)
library(seewave)
library(pracma)
library(oce)

#Import wavFile
LiloanCgrassAug2019 <- readWave('D:/kaya/Documents/1 Thesis/Analysis/Initial analysis/ACi/wavLiloanCGrassAug2019/671404068.190813161502.wav', 
                                from = 1, to = Inf,
                                header = FALSE, toWaveMC = NULL,
                                units = c("samples", "seconds", "minutes", "hours"))

#Calculate the ACI using 48000Hz
multiple_sounds(directory = 'D:/kaya/Documents/1 Thesis/Analysis/Initial analysis/ACi/wav', 
                resultfile = 'D:/kaya/Documents/1 Thesis/Analysis/Lilo-an_Aug20192k.csv', 
                soundindex = 'acoustic_complexity')

#Based from Bittencourt et al.(2020)

#Calculated ACI for two broadband frequencies LFACI 63Hz to 3kHz and HFACI 3kHz to 24kHz
# 1024 FFT (robust to different recording stations)
# j = 5

#LFACI
multiple_sounds(directory = 'D:/kaya/Documents/1 Thesis/Analysis/Initial analysis/ACi/wav',
                resultfile = 'D:/kaya/Documents/1 Thesis/Analysis/LFACI_Lilo-an_Aug20192k.csv',
                soundindex = 'acoustic_complexity', min_freq = 20, max_freq = 2000,
                fft_w = 4096, j = 5)
#HFACI
multiple_sounds(directory = 'D:/kaya/Documents/1 Thesis/Analysis/Initial analysis/ACi/wav',
                resultfile = 'D:/kaya/Documents/1 Thesis/Analysis/HFACI_Lilo-an_Aug20192k.csv',
                soundindex = 'acoustic_complexity', min_freq = 3000, max_freq = 24000,
                fft_w = 4096, j = 5)

#NDSI - estimate the level of anthropogenic disturbance
multiple_sounds(directory = 'D:/kaya/Documents/1 Thesis/Analysis/Initial analysis/ACi/wav',
                resultfile = 'D:/kaya/Documents/1 Thesis/Analysis/NDSI_Lilo-an_Aug20192k.csv',
                soundindex = "ndsi", anthro_min = 1000, anthro_max = 2000, bio_min = 2000,
                bio_max = 11000, fft_w = 4096)
