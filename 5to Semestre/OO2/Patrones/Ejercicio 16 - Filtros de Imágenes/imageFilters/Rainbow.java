package unlp.oo2.patrones.ej16.imageFilters;

import java.awt.Color;
import java.awt.image.BufferedImage;

public class Rainbow extends Filter {
  public BufferedImage filter(BufferedImage image) {
    for (int x = 0; x < image.getWidth(); x++) {
      for (int y = 0; y < image.getHeight(); y++) {
        // Get the HSB for the image
        Color color = new Color(image.getRGB(x, y));
        float[] hsb = Color.RGBtoHSB(color.getRed(), color.getGreen(), color.getBlue(), null);
        
        // Correct the hue
        hsb[0] = (float)x / (float)image.getWidth();
        
        // Create the new color
        int rgb = Color.HSBtoRGB(hsb[0], hsb[1], hsb[2]);
        
        // Set the color in the image
        image.setRGB(x, y, rgb);
      }
    }
    
    // Return the image
    return image;
  } 
}
