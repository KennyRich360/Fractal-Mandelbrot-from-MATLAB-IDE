% Set the boundaries of the complex plane
x_min = -2.1;
x_max = 0.8;
y_min = -1.2;
y_max = 1.2;

% Set the resolution of the image
resolution = 2000;

% Create a grid of complex numbers
[x, y] = meshgrid(linspace(x_min, x_max, resolution), linspace(y_min, y_max, resolution));
c = x + 1i * y;

% Set the maximum number of iterations
max_iterations = 100;

% Initialize the fractal image
fractal = zeros(resolution);

% Iterate over each point in the complex plane
for i = 1:resolution
    for j = 1:resolution
        z = c(i, j);
        iter = 0;
        while abs(z) <= 2 && iter < max_iterations
            z = z^2 + c(i, j);
            iter = iter + 1;
        end
        fractal(i, j) = iter;
    end
end

% Colormap for the fractal image
colormap('hot');

% Plot the fractal image
image(fractal);
axis equal;
axis off;
title('Mandelbrot Set');