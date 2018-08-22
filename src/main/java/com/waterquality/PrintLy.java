package com.waterquality;

import java.awt.*;
import java.awt.print.*;

public class PrintLy {
    public static boolean printCard(final String bill ){
        final PrinterJob job = PrinterJob.getPrinterJob();


        Printable contentToPrint = (graphics, pageFormat, pageIndex) -> {
            Graphics2D g2d = (Graphics2D) graphics;

            g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
            g2d.setFont(new Font("Monospaced", Font.BOLD, 10));

            String[] billz = bill.split(";");
            int y = 15;
            //draw each String in a separate line
            for (int i = 0; i < billz.length; i++) {
                graphics.drawString(billz[i], 5, y);
                y = y + 15;
            }

            if (pageIndex >0){return Printable.NO_SUCH_PAGE;} //Only one page
            return Printable.PAGE_EXISTS;
        }; PageFormat pageFormat = new PageFormat();
        pageFormat.setOrientation(PageFormat.PORTRAIT);
        Paper pPaper = pageFormat.getPaper();


        pPaper.setImageableArea(0, 0, pPaper.getWidth() , pPaper.getHeight() -2);
        pageFormat.setPaper(pPaper);

        job.setPrintable(contentToPrint, pageFormat);

        try {
            job.print();

        } catch (PrinterException e) {
            System.err.println(e.getMessage());
        }
        return true;
    }

}
