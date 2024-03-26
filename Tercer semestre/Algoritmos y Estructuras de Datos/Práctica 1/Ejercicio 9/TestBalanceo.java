package tp1.ejercicio9;

public class TestBalanceo {
	public static boolean validarExpresion(String exp) {
		int i = 0;
		boolean esValida = true;
		String poppedElem;
		Stack<String> pilaChar = new Stack<String>();
		
		while (i < exp.length() && esValida) {
			if (exp.charAt(i) == '(') {
				pilaChar.push("(");
			} else if (exp.charAt(i) == '[') {
				pilaChar.push("[");
			} else if (exp.charAt(i) == '{') {
				pilaChar.push("{");
			} else if (pilaChar.isEmpty()) {
				esValida = false;
			} else if (exp.charAt(i) != ' ') {
				poppedElem = pilaChar.pop();
				if (exp.charAt(i) == ')') {
					if (!poppedElem.equals("("))
						esValida = false;
				}
				if (exp.charAt(i) == ']') {
					if (!poppedElem.equals("["))
						esValida = false;
				}
				if (exp.charAt(i) == '}') {
					if (!poppedElem.equals("{"))
						esValida = false;
				}
			}
			i++;
		}
		
		if (!pilaChar.isEmpty())
			esValida = false;
		
		return esValida;
	}
}
