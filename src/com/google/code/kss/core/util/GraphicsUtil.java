package com.google.code.kss.core.util;

import java.awt.image.BufferedImage;
import java.awt.image.ColorConvertOp;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import com.google.code.kss.tool.ide.Wireframesketcher;

public class GraphicsUtil {

	/*
	 * This function converts an image to a grayscaled (black and white) image.
	 * 
	 * @inputFile the original image (without the path) before conversion e.g.
	 * colorfulimage.png
	 * 
	 * @return the converted image (without the path) e.g. blackandwhite.png
	 */
	public static String toGrayScaleImage(String inputFile) throws Exception {
		String ext = null;
		if ((ext = Wireframesketcher.getImageFileExtension(inputFile)) != null) {
			if (ext != null) {
				ext = ext.toLowerCase();
				if (!"jpg".equals(ext) && !"png".equals(ext)
						&& !"gif".equals(ext) && !"bmp".equals(ext)) {
					throw new Exception("Unsupported format");
				}
			}
		}
		// GraphicsEnvironment ge = GraphicsEnvironment
		// .getLocalGraphicsEnvironment();
		// GraphicsDevice gd = ge.getDefaultScreenDevice();
		// GraphicsConfiguration gc = gd.getDefaultConfiguration();

		BufferedImage src;
		File in = null;
		try {
			src = ImageIO
					.read(ClassLoader.getSystemResourceAsStream(inputFile));
			in = new File(ClassLoader.getSystemResource(inputFile).toURI());
		} catch (IOException e) {
			throw new Exception("Error in reading input image '" + inputFile
					+ "' : " + e);
		}
		BufferedImage dest = new BufferedImage(src.getWidth(), src.getHeight(),
				BufferedImage.TYPE_BYTE_GRAY);

		ColorConvertOp op = new ColorConvertOp(src.getColorModel()
				.getColorSpace(), dest.getColorModel().getColorSpace(), null);

		op.filter(src, dest);

		// get the current directory of the inputFile
		String fs = System.getProperty("file.separator");
		String temp = in.getAbsoluteFile().toString();
		int index = temp.lastIndexOf(fs);
		String outputFile = null;
		if (index > -1) {
			outputFile = temp.substring(0, index);
			outputFile = outputFile + fs;
			outputFile = outputFile
					+ Wireframesketcher
							.getImageFileNameWithoutExtension(inputFile);
			outputFile = outputFile + "_FDTGrayScaled" + "." + ext;
		}

		File out = new File(outputFile);
		try {
			ImageIO.write(dest, ext, out);
		} catch (Exception e) {
			throw new Exception("Error in writing output image '" + outputFile
					+ "' : " + e);
		}

		System.out.println("Grayscaled image '" + out.getAbsolutePath() + "'");
		return out.getAbsolutePath();
	}

}
