# Image Filtering using Convolution

## Description

This program, written in Julia, is designed to process images using convolutional techniques. Convolution is a fundamental operation in image processing, enabling tasks such as edge detection, blurring, and sharpening. The program implements basic convolutional filters as well as edge filtering.

#### Example

- Noised Image

<img src="https://github.com/knrdsmt/Denoising-filter-in-Julia/blob/main/noised.jpg?raw=true" alt="Noised image" width="55%" height="auto" />

- Filtered Image

<img src="https://github.com/knrdsmt/Denoising-filter-in-Julia/blob/main/filtered.jpeg?raw=true" alt="Image filtered" width="55%" />

## Usage

1. **Installation of Required Packages**
    - Ensure you have Julia installed along with the `Images` and `ColorTypes` packages. If not, install them using the package manager.

2. **Downloading the Source Code**
    - Copy the source code into a file with a `.jl` extension.

3. **Preparing the Image**
    - Place the image you want to process in an accessible directory.
    - Set the `load_path` variable to the path of the image you want to load.

4. **Running the Program**
    - Launch the Julia interpreter and load the source code using the `include("filename.jl")` command.

5. **Calling the Convolution Function**
    - Call the `image_convolution(image)` function with the loaded image as an argument.

6. **Saving the Resulting Image**
    - The resulting image will be saved at the path specified in the `save_path` variable.

## Functions

- `image_convolution(image)`: The main function performing convolutional operations on the image. It handles both grayscale and color images.

## Notes

- The program supports images in formats such as PNG, JPEG, and others supported by the `Images` package.
- Before saving the resulting image, the program normalizes pixel values to the range [0, 1].


## License

This program is provided under the MIT License. See the `LICENSE` file for details.
