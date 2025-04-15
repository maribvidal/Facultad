package unlp.oo2.patrones.ej8;

import java.util.zip.CRC32;

public class CRC32_Calculator implements ICRCCalculator {
	public long crcFor(String datos) {
		CRC32 crc = new CRC32();
		crc.update(datos.getBytes());
		long result = crc.getValue();
		return result;
	}
}