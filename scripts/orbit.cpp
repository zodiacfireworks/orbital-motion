#include<iostream>
#include<fstream>
#include<cmath>

int main() {
    // Parametros Globales
    const double PI = 3.14159265358979;
    const double G = 4 * std::pow(PI, 2);
    const double time_step = 0.0027397260273972603; // 1 día
    const int steps = 365 * 2; // 2 años

    // Output file
    const char fileName[] = "orbit.csv";
    std::ofstream outputFile;

    // Earth varibles
    double earthR;
    double earthRx;
    double earthRy;
    double earthVx;
    double earthVy;
    double earthAx;
    double earthAy;

    // Open file stream
    outputFile.open(fileName);

    // Earth initial contions
    earthRx = -1;
    earthRy = 0;

    earthR = std::sqrt(std::pow(earthRx, 2) + std::pow(earthRy, 2));

    earthVx = 0;
    earthVy = 6.2783201069518713;

    earthAx = -1 * G * earthRx / std::pow(earthR, 3);
    earthAy = -1 * G * earthRx / std::pow(earthR, 3);

    // Earth motion
    for(int i=0; i < steps; i++) {
        outputFile << earthRx << ", "
                   << earthRy << ", "
                   << earthVy << ", "
                   << earthVy << ", "
                   << earthAy << ", "
                   << earthAy << std::endl;

        earthRx = earthRx + earthVx * time_step + 0.5 * earthAx * pow(time_step, 2);
        earthRy = earthRy + earthVy * time_step + 0.5 * earthAy * pow(time_step, 2);

        earthR = std::sqrt(std::pow(earthRx, 2) + std::pow(earthRy, 2));

        earthVx = earthVx + earthAx * time_step;
        earthVy = earthVy + earthAy * time_step;

        earthAx = -1 * G * earthRx / std::pow(earthR, 3);
        earthAy = -1 * G * earthRy / std::pow(earthR, 3);
    }

    outputFile.close();

    return 0;
}
