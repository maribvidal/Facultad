package unlp.oo2.patrones.ej16.imageFilters;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;

public class Artifacter extends Filter {
  public static File tempFile = new File("...");
  public static float compressionQuality = 0.005f;
    
  public BufferedImage filter(BufferedImage image) {
    // Change the image to a jpg to satisfy the native image writer
    /*try {
      ImageIO.write(image, "jpg", tempFile);
      image = ImageIO.read(tempFile);
    } catch (IOException exception) {
      System.err.println("Unable to rewrite image as jpg\n" + exception);
    }*/
      
    // Get the jpeg image writer
    ImageWriter writer = (ImageWriter)ImageIO.getImageWritersByFormatName("jpg").next();
    
    // Set the compression quality
    ImageWriteParam writerParams = writer.getDefaultWriteParam();
    writerParams.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
    writerParams.setCompressionQuality(Artifacter.compressionQuality);
    
    // Try/Catch for File IO
    try {
      // Write the file
      FileImageOutputStream output = new FileImageOutputStream(Artifacter.tempFile);
      writer.setOutput(output);
      IIOImage tempImage = new IIOImage(image, null, null);
      writer.write(null, tempImage, writerParams);
      writer.dispose();
      
      // Read the file
      image = ImageIO.read(Artifacter.tempFile);
    } catch (IOException exception) {
      System.err.println("Unable to read temp file for artifacter\n" + exception);
    }
    
    return image;
  }
}
