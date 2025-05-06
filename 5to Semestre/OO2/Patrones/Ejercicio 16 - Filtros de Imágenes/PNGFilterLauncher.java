package unlp.oo2.patrones.ej16;

import unlp.oo2.patrones.ej16.imageFilters.*;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

public class PNGFilterLauncher {
  private static Map<String, Filter> filters = new HashMap<String, Filter>();
  private static ArrayList<Filter> activeFilters = new ArrayList<Filter>();
  private static File inputFile;
  private static File outputFile;

  public static void main(String args[]) {
    // Initialize the list of filers
    PNGFilterLauncher.initializeFilters();

    // Process the arguments
    if (args.length < 2) {
      System.out.println("Usage: java Main input-file output-file [--filter]");
      return;
    }
    PNGFilterLauncher.processArgs(args);

    // Read the image file
    BufferedImage image;
    try {
      image = ImageIO.read(inputFile);
    } catch(IOException exception) {
      System.err.println("Unable to read file: " + inputFile + "\n" + exception);
      return;
    }

    // Convert to 8-bit RGB Colorspace
    BufferedImage newImage = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_RGB);
    newImage.getGraphics().drawImage(image, 0, 0, null);
    image = newImage;

    // Filter the image
    for (int i = 0; i < activeFilters.size(); i++) {
      image = ((Filter)activeFilters.get(i)).filter(image);
    }

    // Write the image file
    try {
      ImageIO.write(image, "png", outputFile);
    } catch(IOException exception) {
      System.err.println("Unable to write file: " + outputFile + "\n" + exception);
      return;
    }
  }

  static void processArgs(String args[]) {
    // Get the input and output file values
    inputFile = new File(args[0]);
    outputFile = new File(args[1]);

    for (int i = 2; i < args.length; i++) {
      Filter filter = filters.get(args[i]);
      if (filter == null) {
        System.out.println("No filter matches '" + args[i] + "'");
      } else {
        activeFilters.add(filter);
      }
    }
  }

  static void initializeFilters() {
    filters.put("--rainbow", new Rainbow());
    filters.put("--artifacter", new Artifacter());
    filters.put("--rgb-shifter", new RGBShifter());
    filters.put("--repeater", new Repeater());
    filters.put("--rgb-shift-repeater", new RGBShiftRepeater());
    filters.put("--monochrome", new Monochrome());
    filters.put("--none", new Dull());
  }
}
