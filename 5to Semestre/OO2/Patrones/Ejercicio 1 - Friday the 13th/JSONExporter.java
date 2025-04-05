package biblioteca;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class JSONExporter implements IExporter {
	private JSONObject exportar(Socio socio) {
		JSONObject objetoJSON = new JSONObject();
		
		objetoJSON.put("nombre", socio.getNombre());
		objetoJSON.put("email", socio.getEmail());
		objetoJSON.put("legajo", socio.getLegajo());
		
		return objetoJSON;
	}
	
	public String exportar(List<Socio> socios) {
		
		if (socios.isEmpty()) {
			return "[]";
		}
		
		JSONArray vectorJSON = new JSONArray();
		socios.forEach(soc -> {
			JSONObject temp = exportar(soc);
			vectorJSON.add(temp);
		});
		
		return vectorJSON.toJSONString();
	}
}
