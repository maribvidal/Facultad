package ar.edu.info.oo2.filtros;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import ar.edu.info.oo2.pipes.ImageFilterPipe;

public class Test {
	public static void main(String[] args) {
		SecuenciadorMonochrome secMono = new SecuenciadorMonochrome();
		SecuenciadorMultichrome secMult = new SecuenciadorMultichrome();
		
		BufferedImage image1 = null;
		BufferedImage image2 = null;
		
		try {
			image1 = ImageIO.read(new File("C://Users//Usuario//eclipse-workspace//filters-pipes//img//img-test.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			image2 = ImageIO.read(new File("C://Users//Usuario//eclipse-workspace//filters-pipes//img//img-test2.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		secMono.agregarFiltroRepeater();
		ImageFilterPipe pipeMono = secMono.construirSecuenciaFiltros();
		
		secMult.agregarFiltroRainbow();
		secMult.agregarFiltroRepeater();
		secMult.agregarFiltroRGBShifter();
		ImageFilter pipeMult = secMult.construirSecuenciaFiltros();
		
		BufferedImage imagenFiltrada1 = pipeMono.filter(image1);
		BufferedImage imagenFiltrada2 = pipeMult.filter(image2);
		
		try {
			ImageIO.write(imagenFiltrada1, "png", new File("C://Users//Usuario//eclipse-workspace//filters-pipes//img//img-test-exp.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ImageIO.write(imagenFiltrada2, "png", new File("C://Users//Usuario//eclipse-workspace//filters-pipes//img//img-test-exp2.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
