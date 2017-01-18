{
    if ( $1 == "/" ) {
        printf("%s\t%f\n", $2, sum / count);
        count = 0;
        sum = 0.0;
    }else {
        sum += $1;
        ++count;
    }
}
