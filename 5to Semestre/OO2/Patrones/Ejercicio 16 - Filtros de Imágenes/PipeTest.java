package ar.edu.info.oo2.filtros;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;

import ar.edu.info.oo2.pipes.*;

public class PipeTest {
	public static void main(String[] args) {
		// Crear una secuencia repeater -> monochrome
		Monochrome filtroMono = new Monochrome();
		Repeater filtroRep = new Repeater();
		ImageFilterPipeInterface pipe = new ImageFilterPipe(filtroMono);
		pipe.addFilter(filtroRep);
		
		// Cargar imagen
		BufferedImage img = cargarImagen("...\\img-test.jpg");
		
		// Transformarla y exportarla
		crearImagen(pipe.filter(img));
		
		System.out.println("Trabajo terminado");
	}
	
	private static BufferedImage cargarImagen(String path) {
		File arch = new File(path);
		BufferedImage image = null;
	    try {
	        image = ImageIO.read(arch);
	      } catch(IOException exception) {
	        System.err.println("Unable to read file: " + path + "\n" + exception);
	      }
	    return image;
	}
	
	private static BufferedImage crearImagen(BufferedImage image) {
		 File tempFile = new File("...\\img-test-exp.jpg");
		 float compressionQuality = 0.005f;
	      
	    // Get the jpeg image writer
	    ImageWriter writer = (ImageWriter)ImageIO.getImageWritersByFormatName("jpg").next();
	    
	    // Set the compression quality
	    ImageWriteParam writerParams = writer.getDefaultWriteParam();
	    writerParams.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
	    writerParams.setCompressionQuality(Artifacter.compressionQuality);
	    
	    // Try/Catch for File IO
	    try {
	      // Write the file
	      FileImageOutputStream output = new FileImageOutputStream(tempFile);
	      writer.setOutput(output);
	      IIOImage tempImage = new IIOImage(image, null, null);
	      writer.write(null, tempImage, writerParams);
	      writer.dispose();
	      
	      // Read the file
	      image = ImageIO.read(tempFile);
	    } catch (IOException exception) {
	      System.err.println("Unable to read temp file for artifacter\n" + exception);
	    }
	    
	    return image;
	  }
}
