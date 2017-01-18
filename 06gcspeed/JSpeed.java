/*** Copyright: OGIHARA Takeshi, Aug. 2011 ***/

import java.io.*;
import java.lang.Math;

class JSpeed {
    final static int MASS = 2000;
    final static int ARRAYSIZE = (1 << 6);
    final static int LOOP = 1500;
    final static int ACCIDENT = 16;

    JSpeed next;
    byte huge[];

    public JSpeed(JSpeed obj) {
        next = obj;
        huge = new byte[MASS];
    }

    public static void main(String[] args) {
        int i, j;
        JSpeed buf[] = new JSpeed[ARRAYSIZE];

        for (i = 0; i < LOOP; i++) {
            for (j = 0; j < LOOP; j++) {
                int idx = (int)(Math.random() * ARRAYSIZE);
                if (buf[idx] != null && (int)(Math.random() * ACCIDENT) == 0) {
                    buf[idx] = null;
                }else {
                    JSpeed t = buf[idx];
                    buf[idx] = new JSpeed(t);
                }
            }
        }
    }
}
