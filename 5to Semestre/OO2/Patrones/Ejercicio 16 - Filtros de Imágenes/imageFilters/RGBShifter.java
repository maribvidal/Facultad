package unlp.oo2.patrones.ej16.imageFilters;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.util.Random;

public class RGBShifter extends Filter {
  public BufferedImage filter(BufferedImage image) {
    Random rand = new Random();
    int rShift = rand.nextInt(256);
    int bShift = rand.nextInt(256);
    int gShift = rand.nextInt(265);

    for (int x = 0; x < image.getWidth(); x++) {
      for (int y = 0; y < image.getHeight(); y++) {
        Color color = new Color(image.getRGB(x, y));
        int red = this.shiftValue(color.getRed(), rShift);
        int green = this.shiftValue(color.getGreen(), gShift);
        int blue = this.shiftValue(color.getBlue(), bShift);
        image.setRGB(x, y, (new Color(red, green, blue).getRGB()));
      }
    }

    return image;
  }

  public int shiftValue(int original, int shiftMagnitude) {
    return (original + shiftMagnitude) % 256;
  }
}
