#ifndef INTERVAL_H
#define INTERVAL_H

class Interval {
private:
    double inf;
    double sup;

public:
    Interval();

    Interval(double, double);

    Interval(double);

    ~Interval();

    double getInf() const;

    double getSup() const;

};

#endif
