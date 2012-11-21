package integra;

import com.sun.jna.Pointer;

import java.nio.charset.Charset;

public class IntegraJna {
    public static final String AnsiPszToString(byte[] psz) {
        int len = 0;
        while (psz[len] != '\0' && len < psz.length) { len++; };
        return new String(psz, 0, len, Charset.forName("windows-1250"));
    }

    public static final String AnsiPszToString(Pointer psz, int maxLength) {
        int len = 0;
        while (psz.getByte(len) != '\0' && len < maxLength) { len++; };
        return new String(psz.getByteArray(0,len), Charset.forName("windows-1250"));
    }

    public static final String AnsiPszToString(Pointer psz) {
        return AnsiPszToString(psz, 1024);
    }
}
