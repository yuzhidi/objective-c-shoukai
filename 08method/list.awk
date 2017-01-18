{
    if ( $1 == "/" ) {
        result[++prog] = sum / count;
        count = 0;
        sum = 0.0;
    }else {
        sum += $1;
        ++count;
    }
}
END {
    for (i = 1; i <= 3; i++)
        call[i] = result[i] - result[4];
    for (i = 1; i <= 3; i++)
        printf("prog%d: %6.3f  %6.3f  %6.3f\n",
            i, result[i], call[i], call[i] / call[3]);
    printf("prog4:  %5.3f\n", result[4]);
    printf("prog5:  %5.3f\n", result[5]);
}
