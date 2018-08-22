//package com.waterquality;
//
//
//import javax.print.attribute.HashPrintRequestAttributeSet;
//import javax.print.attribute.PrintRequestAttributeSet;
//import javax.print.attribute.standard.OrientationRequested;
//import java.awt.*;
//import java.awt.print.PageFormat;
//import java.awt.print.Paper;
//import java.awt.print.Printable;
//import java.awt.print.PrinterJob;
//
//import static java.awt.print.Printable.NO_SUCH_PAGE;
//import static java.awt.print.Printable.PAGE_EXISTS;
//
//public class Printer  {
//    private void printReceipt(){
//        PageFormat format = new PageFormat();
//        Paper paper = new Paper();
//
//        double paperWidth = 3.25;
//        double paperHeight = 11.69;
//        double leftMargin = 0.19;
//        double rightMargin = 0.25;
//        double topMargin = 0;
//        double bottomMargin = 0.01;
//
//        paper.setImageableArea(leftMargin * 72.0, topMargin * 72.0,
//                (paperWidth - leftMargin - rightMargin) * 72.0,
//                (paperHeight - topMargin - bottomMargin) * 72.0);
//
//        format.setPaper(paper);
//
//        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
//        aset.add(OrientationRequested.PORTRAIT);
//
//        PrinterJob printerJob = PrinterJob.getPrinterJob();
//        Printable printable = new ATM();
//        format = printerJob.validatePage(format);
//        printerJob.setPrintable(printable, format);
//        try {
//            printerJob.print(aset);
//        }
//        catch (Exception e) {
//        }
//    }
//
//    private void drawString(Graphics g, String text, int x, int y) {
//        for (String line : text.split("\n"))
//            g.drawString(line, x, y += g.getFontMetrics().getHeight());
//    }
//
//    @Override
//    public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
//        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
//        Date date = new Date();
//        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
//        Date time = new Date();
//        String currDate = dateFormat.format(date);
//        String currTime = timeFormat.format(time);
//
//
//        if (pageIndex < 0 || pageIndex >= 1) {
//            return Printable.NO_SUCH_PAGE;
//        }
//        Graphics2D g2d = (Graphics2D) graphics;
//        g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
//        Font font = new Font("Monospaced",Font.PLAIN, 10);
//        g2d.setFont(font);
//
//        drawString(graphics,"hello"
//                + "\nTRANSACTION RECORD"
//                + "\nDATE    TIME    LOCATION"
//                + "\n"+currDate+currTime+atmLocation
//                + "\nTRANSACTION: WITHDRAW"
//                + "\nAmount: "+formattedAmount
//                + "\nTOTAL BALANCE: "+formattedBalance
//                + "\nTHANK YOU FOR BANKING WITH US.", 20, 20);
//        // graphics.setFont(graphics.getFont().deriveFont(20f));
//        //drawString(graphics, "part1\npart2", 80, 40);
//
//        return Printable.PAGE_EXISTS;
//    }
//
//}
