package integra.jna;
import com.sun.jna.Pointer;
import com.sun.jna.Structure;

import java.util.Arrays;
import java.util.List;
/**
 * <i>native declaration : iGammaJNAiGammaJNA.h</i><br>
 * This file was autogenerated by <a href="http://jnaerator.googlecode.com/">JNAerator</a>,<br>
 * a tool written by <a href="http://ochafik.com/">Olivier Chafik</a> that <a href="http://code.google.com/p/jnaerator/wiki/CreditsAndLicense">uses a few opensource projects.</a>.<br>
 * For help, please visit <a href="http://nativelibs4java.googlecode.com/">NativeLibs4Java</a> , <a href="http://rococoa.dev.java.net/">Rococoa</a>, or <a href="http://jna.dev.java.net/">JNA</a>.
 */
public class IGAMMA_QUERYENTRY extends Structure {
	public int iSize;
	/// C type : char[64]
	public byte[] szName = new byte[64];
	/// C type : char[256]
	public byte[] szValue = new byte[256];
	public IGAMMA_QUERYENTRY() {
		super();
		setAlignType(Structure.ALIGN_NONE);
	}
	public IGAMMA_QUERYENTRY(Pointer pointer) {
		super(pointer, Structure.ALIGN_NONE);
		read();
	}
   @Override
	protected List getFieldOrder() {
		return Arrays.asList("iSize", "szName", "szValue");
	}
	/**
	 * @param szName C type : char[64]<br>
	 * @param szValue C type : char[256]
	 */
	public IGAMMA_QUERYENTRY(int iSize, byte szName[], byte szValue[]) {
		super();
		this.iSize = iSize;
		if (szName.length != this.szName.length) 
			throw new IllegalArgumentException("Wrong array size !");
		this.szName = szName;
		if (szValue.length != this.szValue.length) 
			throw new IllegalArgumentException("Wrong array size !");
		this.szValue = szValue;
		setAlignType(Structure.ALIGN_NONE);
	}
	public static class ByReference extends IGAMMA_QUERYENTRY implements Structure.ByReference {
		
	};
	public static class ByValue extends IGAMMA_QUERYENTRY implements Structure.ByValue {
		
	};
}