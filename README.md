# Ultrasound Image Denoising with video streams
This repository contains Matlab code to remove speckled noise from ultrasound videos.

The below images shows an example of removing noise from ultrasound image




The repository contains following files:

```
├── imgs                     # Directory containing inferred images.
├── main.m                   # Matlab file to run code.
├── breakVideo.m             # Matlab function to break video into image frames.
├── joinImage.m              # Matlab function to join images to video.
├── breakVideo.m             # Matlab function to break video into image frames.
├── mean_speckle.m           # Matlab function to apply mean filter.
├── median_speckle.m         # Matlab function to apply median filter.
├── fourier_speckle.m        # Matlab function to apply fourier filter.
├── PSNR.m                   # Matlab function to calculate average PSNR value.
├── recursive_temp.m         # Matlab function for recursive temporal filtering.
├── sample.mp4               # Sample video for testing the code.
├── filter_video.avi         # Filtered video generated by code.
└── README.md
```

## How to use?

Run main.m file.
